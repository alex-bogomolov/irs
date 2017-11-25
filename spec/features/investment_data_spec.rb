require 'rails_helper'

include ActionView::Helpers::NumberHelper

RSpec.describe 'investments', type: :feature do
  before :each do
    seed_test_database
  end

  describe 'index' do
    it 'displays investment data' do
      visit '/investment_data'

      InvestmentData.find_each do |investment_data|
        expect(page).to have_content(investment_data.investor.full_name)
        expect(page).to have_content(investment_data.investment.name)
        expect(page).to have_content(number_to_currency(investment_data.invest_amount))
        expect(page).to have_content(investment_data.formatted_investment_date)
      end
    end
  end

  describe 'new/create' do
    it 'creates investment data' do
      visit '/investment_data/new'

      find(:xpath, '//*[@id="investment_data_investor_id"]/option[2]').select_option
      find(:xpath, '//*[@id="investment_data_investment_id"]/option[4]').select_option

      fill_in('Invest amount', with: 30_000)

      click_on 'Create Investment data'

      expect(page).to have_content('Investment data was successfully created.')
      expect(page).to have_content(number_to_currency(30_000))
    end


    it 'should not create investment' do
      visit '/investment_data/new'

      find(:xpath, '//*[@id="investment_data_investor_id"]/option[2]').select_option
      find(:xpath, '//*[@id="investment_data_investment_id"]/option[4]').select_option

      click_on 'Create Investment data'

      expect(page).to have_content("can't be blank")
    end

    it 'should show error' do
      visit '/investment_data/new'

      find(:xpath, '//*[@id="investment_data_investor_id"]/option[2]').select_option
      find(:xpath, '//*[@id="investment_data_investment_id"]/option[2]').select_option

      fill_in('Invest amount', with: 50_000)

      click_on 'Create Investment data'

      expect(page).to have_content('Total invest amount for investment')
      expect(page).to have_content('and it can not be bigger than')
    end
  end

  describe 'update' do

    it 'updates investment data' do
      visit '/investment_data'

      find(:xpath, '(//a[text()="Edit"])[1]').click

      expect(page).to have_content('Editing Investment Data')

      fill_in 'Invest amount', with: 45_000

      click_on 'Update Investment data'

      expect(page).to have_content('Investment data was successfully updated.')
      expect(page).to have_content(number_to_currency(45_000))
    end

    it 'does not update investment' do
      visit '/investment_data'

      find(:xpath, '(//a[text()="Edit"])[1]').click

      expect(page).to have_content('Editing Investment Data')

      fill_in 'Invest amount', with: ''

      click_on 'Update Investment data'

      expect(page).to have_content("can't be blank")
    end

    it 'displays error message' do
      visit '/investment_data'

      find(:xpath, '//td[text()="$32,000.00"]/../td/a[text()="Edit"]').click

      expect(page).to have_content('Editing Investment Data')

      fill_in 'Invest amount', with: 60_000

      click_on 'Update Investment data'

      expect(page).to have_content('Total invest amount for investment')
      expect(page).to have_content('and it can not be bigger than')
    end
  end

  describe 'delete', js: true do
    it 'deletes investment data' do
      visit '/investment_data'
      expect{find(:xpath, '(//a[text()="Destroy"])[1]').click}.to change{InvestmentData.count}.by(-1)
      expect(page).to have_content('Investment data was successfully destroyed.')
    end

    it 'should display error' do
      visit '/investment_data'
      find(:xpath, '(//a[text()="Jacobs Group"]/../../td/a[text()="Destroy"])[1]').click
      expect(page).to have_content('Investment data was successfully destroyed.')

      find(:xpath, '(//a[text()="Jacobs Group"]/../../td/a[text()="Destroy"])[1]').click
      expect(page).to have_content('Investment data was successfully destroyed.')

      find(:xpath, '(//a[text()="Jacobs Group"]/../../td/a[text()="Destroy"])[1]').click
      expect(page).to have_content('Investment data was successfully destroyed.')

      find(:xpath, '(//a[text()="Jacobs Group"]/../../td/a[text()="Destroy"])[1]').click
      expect(page).to have_content('Investment data was successfully destroyed.')

      find(:xpath, '(//a[text()="Jacobs Group"]/../../td/a[text()="Destroy"])[1]').click
      expect(page).to have_content(' has no investment data')
    end
  end
end