class Investment < ActiveRecord::Base
  class << self
    def sequence_name
      'investor_sequence'
    end
  end

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :min_invest_amount, presence: true
  validates :max_invest_amount, presence: true
  validates :max_total_invest_amount, presence: true
  validates :marked, inclusion: {in: [true, false]}
end