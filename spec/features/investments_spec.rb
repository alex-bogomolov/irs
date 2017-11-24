require 'rails_helper'

RSpec.describe 'investments', type: :feature do
  before :each do
    FactoryBot.reload
    create_list(:investment, 3)
  end

  describe 'index' do
    it 'displays investments' do
      visit '/investments'

      Investment.find_each do |investment|
        expect(page).to have_content(investment.name)
        expect(page).to have_content(investment.address)
        expect(page).to have_content(investment.country)
        expect(page).to have_content(investment.city)
      end
    end
  end

  describe 'new/create' do
    it 'creates investment' do
      visit '/investments/new'

      fill_in('Name', with: 'Bernhard Group')
      fill_in('Address', with: '40214 Witting Greens')
      fill_in('City', with: 'Gulgowskiburgh')

      find(:xpath, '//option[20]').select_option

      fill_in('Min invest amount', with: 60000)
      fill_in('Max invest amount', with: 90000)
      fill_in('Max total invest amount', with: 300000)
      find(:xpath, '//label[@for="investment_marked"]').click

      click_on 'Create Investment'

      expect(page).to have_content('Investment was successfully created.')
      expect(page).to have_content('Bernhard Group')
      expect(page).to have_content('40214 Witting Greens')
      expect(page).to have_content('Gulgowskiburgh')
      expect(page).to have_content('Barbados')
      expect(page).to have_content('true')
    end


    it 'should not create investment' do
      visit '/investments/new'

      fill_in('Name', with: 'Bernhard Group')
      fill_in('City', with: 'Gulgowskiburgh')

      find(:xpath, '//option[20]').select_option

      fill_in('Min invest amount', with: 60000)
      fill_in('Max invest amount', with: 90000)
      fill_in('Max total invest amount', with: 300000)
      find(:xpath, '//label[@for="investment_marked"]').click

      click_on 'Create Investment'

      expect(page).to have_content("can't be blank")
    end
  end

  describe 'update' do

    it 'updates investment' do
      visit '/investments'

      find(:xpath, '(//a[text()="Edit"])[1]').click

      expect(page).to have_content('Editing Investment')
      fill_in('Name', with: 'Bernhard Group')

      find(:xpath, '//option[20]').select_option

      click_on 'Update Investment'

      expect(page).to have_content('Investment was successfully updated.')
      expect(page).to have_content('Bernhard Group')
      expect(page).to have_content('Barbados')
    end

    it 'does not update investment' do
      visit '/investments'

      find(:xpath, '(//a[text()="Edit"])[1]').click

      expect(page).to have_content('Editing Investment')
      fill_in('Name', with: '')

      find(:xpath, '//option[20]').select_option

      click_on 'Update Investment'

      expect(page).to have_content("can't be blank")
    end
  end

  describe 'delete' do
    it 'deletes investments', js: true do
      visit '/investments'

      find(:xpath, '(//a[text()="Destroy"])[1]').click

      expect(page).to have_content('Investment was successfully destroyed.')
    end
  end
end