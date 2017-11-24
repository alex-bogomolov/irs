class Investor < ActiveRecord::Base
  class << self
    def sequence_name
      'investor_sequence'
    end
  end
  validates :email, uniqueness: true
end