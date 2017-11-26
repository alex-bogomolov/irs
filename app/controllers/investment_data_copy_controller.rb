class InvestmentDataCopyController < ApplicationController
  def index
    @investment_data_copy = InvestmentDataCopy.all
  end

  def destroy
    InvestmentDataCopy.delete_all
    flash.notice = 'Investment Data Copies are cleared.'
    redirect_to investment_data_copy_url
  end
end