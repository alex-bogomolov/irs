class InvestmentData < ActiveRecord::Base
  class << self
    def table_name
      'investment_data'
    end

    def sequence_name
      'investment_data_sequence'
    end
  end

  validates :investor_id, presence: true
  validates :investment_id, presence: true
  validates :investment_date, presence: true
  validates :invest_amount, presence: true
end