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

  def decrease_invest_amount
    @cursor = Investor.connection.execute('SELECT IRS.MOST_WEALTHY_INVESTORS() FROM DUAL')
    if validate_decrease_invest_amount_params
      investment_id = params.dig(:decrease_invest_amount_params, :investment_id)
      size = params.dig(:decrease_invest_amount_params, :size)
      Investor.connection.execute("BEGIN\nIRS.DECREASE_INVEST_AMOUNT(#{investment_id}, #{size});\nEND;")
      flash.notice = 'Procedure IRS.DECREASE_INVEST_AMOUNT was successfully completed.'
      redirect_to functions_url
    else
      flash.now.alert = 'IRS.DECREASE_INVEST_AMOUNT: invalid params'
      render :index
    end
  rescue ActiveRecord::StatementInvalid => e
    flash.now.alert = e.message
    render :index
  end

  def recalculate_worth
    Investor.connection.execute("BEGIN\nIRS.RECALCULATE_WORTH;\nEND;")
    flash.notice = 'Procedure IRS.RECALCULATE_WORTH was successfully completed.'
    redirect_to functions_url
  end

  def scale_invest_amounts
    @cursor = Investor.connection.execute('SELECT IRS.MOST_WEALTHY_INVESTORS() FROM DUAL')
    if validate_scale_invest_amounts_params
      investment_id = params.dig(:scale_invest_amounts_params, :investment_id)
      percent = params.dig(:scale_invest_amounts_params, :percent).to_f / 100.0
      Investor.connection.execute("BEGIN\nIRS.SCALE_INVEST_AMOUNTS(#{investment_id}, #{percent});\nEND;")
      flash.notice = 'Procedure IRS.SCALE_INVEST_AMOUNTS was successfully completed.'
      redirect_to functions_url
    else
      flash.now.alert = 'IRS.SCALE_INVEST_AMOUNTS: invalid params'
      render :index
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

  def validate_decrease_invest_amount_params
    params.dig(:decrease_invest_amount_params, :investment_id).present? &&
        params.dig(:decrease_invest_amount_params, :size).present? &&
        params.dig(:decrease_invest_amount_params, :investment_id)[/^\d+$/] &&
        params.dig(:decrease_invest_amount_params, :size)[/^\d+$/]
  end

  def validate_scale_invest_amounts_params
    params.dig(:scale_invest_amounts_params, :investment_id).present? &&
        params.dig(:scale_invest_amounts_params, :percent).present? &&
        params.dig(:scale_invest_amounts_params, :investment_id)[/^\d+$/] &&
        params.dig(:scale_invest_amounts_params, :percent).to_f > 0 &&
        params.dig(:scale_invest_amounts_params, :percent).to_f < 100
  end
end