require 'rails_helper'

RSpec.describe 'investors', type: :feature do
  before :each do
    FactoryBot.reload
    create_list(:investor, 5)
  end

  describe 'redirect' do
    it 'redirects to /investors' do
      visit '/'

      Investor.find_each do |investor|
        expect(page).to have_content(investor.first_name)
        expect(page).to have_content(investor.last_name)
        expect(page).to have_content(investor.email)
      end
    end
  end

end