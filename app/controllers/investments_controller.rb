class InvestmentsController < ApplicationController
  before_action :set_investment, only: [:show, :edit, :update, :destroy]

  def index
    @investments = Investment.all
  end

  def show
  end

  def new
    @investment = Investment.new
  end

  def edit
  end

  def create
    @investment = Investment.new(investment_params)

    if @investment.save
      redirect_to @investment, notice: 'Investment was successfully created.'
    else
      render :new
    end
  end

  def update
    if @investment.update(investment_params)
      redirect_to @investment, notice: 'Investment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @investment.destroy
    redirect_to investments_url, notice: 'Investment was successfully destroyed.'
  end

  private
    def set_investment
      @investment = Investment.find(params[:id])
    end

    def investment_params
      p = params.require(:investment).permit(:name, :address, :city, :country, :min_invest_amount, :max_invest_amount, :max_total_invest_amount, :marked)
      p[:country] = ISO3166::Country[p[:country]].translations['en'] if p[:country].present?
      p
    end
end
