class FunctionsController < ApplicationController
  helper_method :validate_align_params, :validate_show_investors_params

  def index
    @cursor = Investor.connection.execute('SELECT IRS.MOST_WEALTHY_INVESTORS() FROM DUAL')
  end

  def align
    if validate_align_params
      @cursor = Investor.connection.execute("SELECT IRS.ALIGN(CITY, #{params.dig(:align_params, :size)}, '#{params.dig(:align_params, :direction)}') FROM INVESTORS")
    end
  end

  def show_investors
    if validate_show_investors_params
      @cursor = Investor.connection.execute("SELECT IRS.SHOW_INVESTORS(#{params.dig(:show_investors_params, :investment_id)}) FROM DUAL");
    end
  end

  private

  def validate_align_params
    params.dig(:align_params, :size).present? &&
        params.dig(:align_params, :direction).present? &&
        params.dig(:align_params, :size)[/^\d?\d$/] &&
        params.dig(:align_params, :direction)[/^right|left|center$/]
  end

  def validate_show_investors_params
    params.dig(:show_investors_params, :investment_id).present? && params.dig(:show_investors_params, :investment_id)[/^\d+$/]
  end
end