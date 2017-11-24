class Investor < ActiveRecord::Base
  class << self
    def sequence_name
      'investor_sequence'
    end
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :city, presence: true
end