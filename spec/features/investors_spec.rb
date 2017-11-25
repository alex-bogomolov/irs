require 'rails_helper'

RSpec.describe 'investors', type: :feature do
  before :each do
    seed_test_database
  end

  describe 'index' do
    it 'displays investors' do
      visit '/investors'

      Investor.find_each do |investor|
        expect(page).to have_content(investor.first_name)
        expect(page).to have_content(investor.last_name)
        expect(page).to have_content(investor.email)
      end
    end
  end

  describe 'new/create' do
    it 'creates investor' do
      visit '/investors/new'

      fill_in('First name', with: 'Ralph')
      fill_in('Last name', with: 'Cremin')
      fill_in('Email', with: 'vallie@littelkutch.net')
      fill_in('City', with: 'Gulgowskiburgh')

      click_on 'Create Investor'

      expect(page).to have_content('Investor was successfully created.')
      expect(page).to have_content('Ralph')
      expect(page).to have_content('Cremin')
      expect(page).to have_content('vallie@littelkutch.net')
      expect(page).to have_content('Gulgowskiburgh')
    end

    it 'should not create investor' do
      visit '/investors/new'

      fill_in('First name', with: 'Ralph')
      fill_in('Email', with: 'vallie@littelkutch.net')
      fill_in('City', with: 'Gulgowskiburgh')

      click_on 'Create Investor'

      expect(page).to have_content("can't be blank")
    end
  end

  describe 'update' do

    it 'updates investor' do
      visit '/investors'

      find(:xpath, '//*[text() = "Rodolfo"]/..//a[text() = "Edit"]').click

      expect(page).to have_content('Editing Investor')

      fill_in('First name', with: 'Ralph')
      fill_in('Last name', with: 'Cremin')

      click_on 'Update Investor'

      expect(page).to have_content('Investor was successfully updated.')
      expect(page).to have_content('Ralph')
      expect(page).to have_content('Cremin')
    end

    it 'does not update investor' do
      visit '/investors'

      find(:xpath, '//*[text() = "Rodolfo"]/..//a[text() = "Edit"]').click

      expect(page).to have_content('Editing Investor')

      fill_in('First name', with: '')
      fill_in('Last name', with: 'Cremin')

      click_on 'Update Investor'

      expect(page).to have_content("can't be blank")
    end
  end

  describe 'delete' do
    it 'deletes investor', js: true do
      visit '/investors'

      expect{find(:xpath, '//*[text() = "Rodolfo"]/..//a[text() = "Destroy"]').click}.to change{InvestmentData.count}.by(-3)

      expect(page).to have_content('Investor was successfully destroyed.')
    end
  end
end