class InvestmentDataCopy < ActiveRecord::Base
  class << self
    def table_name
      'investment_data_copy'
    end

    def sequence_name
      'investment_data_copy_sequence'
    end
  end
end
