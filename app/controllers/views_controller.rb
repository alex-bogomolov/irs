class ViewsController < ApplicationController
  def index
    connection = Investor.connection
    @cursors = {}
    @cursors[:investment_summary] = connection.execute 'SELECT * FROM INVESTMENT_SUMMARY'
    @cursors[:investments_in_current_year] = connection.execute 'SELECT * FROM INVESTMENTS_IN_CURRENT_YEAR ORDER BY INVESTMENT_DATE'
    @cursors[:investors_by_city] = connection.execute 'SELECT * FROM INVESTORS_BY_CITY'
  end
end