# frozen_string_literal: true

class MonthLinesController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def create
    @month_line = MonthLine.new(post_params)
    respond_to do |format|
      if @month_line.save
        format.html { redirect_to request.referrer, notice: "Genial, has creado una linea!" }
      else
        format.html { redirect_to request.referrer, notice: "Algo salio mal", status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @month_line.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: "Post was successfully destroyed." }
    end
  end

  private
    def set_post
      @month_line = MonthLine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:month_line).permit(:concept, :type_id, :value, :additional_info, :paid, :month_id)
    end

end
