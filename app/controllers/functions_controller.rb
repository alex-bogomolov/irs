class FunctionsController < ApplicationController
  def index
    connection = Investor.connection
    @cursors = {}

    if params.dig(:align_params, :size).present? && params.dig(:align_params, :direction).present?
      @cursors[:align] = connection.execute("SELECT IRS.ALIGN(CITY, #{params.dig(:align_params, :size)}, '#{params.dig(:align_params, :direction)}') FROM INVESTORS")
    end

    @cursors[:most_wealthy_investors] = connection.execute('SELECT IRS.MOST_WEALTHY_INVESTORS() FROM DUAL')
    @cursors[:show_investors] = connection.execute('SELECT IRS.SHOW_INVESTORS(ID) FROM INVESTMENTS')
  end

  private

  def validate_params
    params.dig(:align_params, :size).present? &&
        params.dig(:align_params, :direction).present? &&
        params.dig(:align_params, :size)[/^\d?\d$/] &&
        params.dig(:align_params, :direction)[/^right|left|center$/]
  end
end