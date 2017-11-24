class InvestorsController < ApplicationController
  before_action :set_investor, only: [:show, :edit, :update, :destroy]

  def index
    @investors = Investor.all
  end

  def show
  end

  def new
    @investor = Investor.new
  end

  def edit
  end

  def create
    @investor = Investor.new(investor_params)

    if @investor.save
      redirect_to @investor, notice: 'Investor was successfully created.'
    else
      render :new
    end
  end

  def update
    if @investor.update(investor_params)
      redirect_to @investor, notice: 'Investor was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @investor.destroy
    redirect_to investors_url, notice: 'Investor was successfully destroyed.'
  end

  private
    def set_investor
      @investor = Investor.find(params[:id])
    end

    def investor_params
      params.require(:investor).permit(:first_name, :last_name, :email, :city)
    end
end
