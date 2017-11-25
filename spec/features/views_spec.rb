require 'rails_helper'

RSpec.describe 'investors', type: :feature do
  before :each do
    seed_test_database
  end

  describe 'index' do
    it 'displays views' do
      visit '/views'

      expect(page).to have_content('Investment Summary')
      expect(page).to have_content('Investments In Current Year')
      expect(page).to have_content('Investors By City')

      expect(page).to have_content('Jacobs Group')
      expect(page).to have_content('$204,000.00')

      expect(page).to have_content('Rodolfo')
      expect(page).to have_content('White')
      expect(page).to have_content('$40,000.00')

      expect(page).to have_content('23 Jan 2017')
      expect(page).to have_content('New Clark')
      expect(page).to have_content('1')

    end
  end
end