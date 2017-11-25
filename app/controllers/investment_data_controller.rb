class InvestmentDataController < ApplicationController
  before_action :set_investment_data, only: [:show, :edit, :update, :destroy]

  def index
    @investment_data = InvestmentData.joins(:investment, :investor).order('investors.last_name, investors.first_name, investment_data.investment_date')
  end

  def show
  end

  def new
    @investment_data = InvestmentData.new
  end

  def edit
  end

  def create
    @investment_data = InvestmentData.new(investment_data_params)

    if @investment_data.save
      redirect_to @investment_data, notice: 'Investment datum was successfully created.'
    else
      render :new
    end
  end

  def update
    if @investment_data.update(investment_data_params)
      redirect_to @investment_data, notice: 'Investment datum was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @investment_data.destroy
    redirect_to investment_data_index_url, notice: 'Investment datum was successfully destroyed.'
  end

  private
    def set_investment_data
      @investment_data = InvestmentData.find(params[:id])
    end

    def investment_data_params
      params.require(:investment_data).permit(:investor_id, :investment_id, :investment_date, :invest_amount)
    end
end
