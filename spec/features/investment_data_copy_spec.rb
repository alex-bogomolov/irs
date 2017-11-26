require 'rails_helper'

include ActionView::Helpers::NumberHelper

RSpec.describe 'investment data copy', type: :feature do
  before :each do
    seed_test_database
  end

  describe 'index' do
    it 'displays investment data copies' do
      visit '/investment_data_copy'

      InvestmentDataCopy.find_each do |investment_data_copy|
        expect(page).to have_content(investment_data_copy.investor_id)
        expect(page).to have_content(investment_data_copy.investment_id)
        expect(page).to have_content(investment_data_copy.investment_date.strftime('%-d %b %Y'))
        expect(page).to have_content(number_to_currency(investment_data_copy.invest_amount))
      end
    end
  end


  describe 'delete', js: true do
    it 'clears investment data copies' do
      visit '/investment_data_copy'
      expect{click_on 'Clear'}.to change{InvestmentDataCopy.count}.by(-4)
      expect(page).to have_content('Investment Data Copies are cleared.')
    end
  end
end