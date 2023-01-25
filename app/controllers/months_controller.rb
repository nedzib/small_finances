class MonthsController < ApplicationController
  before_action :set_month, only: %i[ show ]

  # GET /months/1 or /months/1.json
  def show
    @balance = get_balance
    @paid_balance = get_paid_balance
    @total_lines = get_total_lines
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_month
      @month = Month.find(params[:id])
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
