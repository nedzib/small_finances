class MonthsController < ApplicationController
  before_action :set_month, only: %i[ show edit update destroy ]

  # GET /months or /months.json
  def index
    @months = Month.all
  end

  # GET /months/1 or /months/1.json
  def show
    @balance = get_balance
    @paid_balance = get_paid_balance
    @total_lines = get_total_lines
  end

  # GET /months/new
  def new
    @month = Month.new
  end

  # GET /months/1/edit
  def edit
  end

  # POST /months or /months.json
  def create
    @month = Month.new(month_params)

    respond_to do |format|
      if @month.save
        format.html { redirect_to month_url(@month), notice: "Month was successfully created." }
        format.json { render :show, status: :created, location: @month }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @month.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /months/1 or /months/1.json
  def update
    respond_to do |format|
      if @month.update(month_params)
        format.html { redirect_to month_url(@month), notice: "Month was successfully updated." }
        format.json { render :show, status: :ok, location: @month }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @month.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /months/1 or /months/1.json
  def destroy
    @month.destroy

    respond_to do |format|
      format.html { redirect_to months_url, notice: "Month was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_month
      @month = Month.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def month_params
      params.fetch(:month, {})
    end

    def get_balance
      balance = 0
      @month.month_lines.each do |line|
        balance += line.value if line.addition?
        balance -= line.value if line.subtract?
      end
      balance
    end

    def get_paid_balance
      @month.month_lines.count(&:paid)
    end

    def get_total_lines
      @month.month_lines.count
    end
end
