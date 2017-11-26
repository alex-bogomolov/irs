require 'rails_helper'

RSpec.describe 'functions and procedures', type: :feature do
  before :each do
    seed_test_database
  end

  describe 'functions', js: true do
    it 'demonstrates align function' do
      visit '/functions'

      find(:xpath, '//form[contains(@class, "align_params")]//input[@type="number"]').set(17)
      find(:xpath, '(//input[@type="radio"])[2]').click

      click_on 'Save Align params'

      expect(page).to have_content('   Brandynchester')
      expect(page).to have_content('Lake Johathanstad')
      expect(page).to have_content('        New Clark')
      expect(page).to have_content('         Kevinton')
      expect(page).to have_content('Bernice Beatty')
    end

    it 'demonstrates show investors function' do
      visit '/functions'

      find(:xpath, '//form[contains(@class,"show_investors_params")]//option[2]').select_option

      click_on 'Save Show investors params'

      expect(page).to have_content 'Elsie Grant, Rachel Wiegand, Eva Graham, Rodolfo White, Bernice Beatty'
    end
  end
end