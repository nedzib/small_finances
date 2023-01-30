# frozen_string_literal: true

class MonthLinesController < ApplicationController

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

  private
    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:month_line).permit(:concept, :type_id, :value, :additional_info, :paid, :month_id)
    end

end
