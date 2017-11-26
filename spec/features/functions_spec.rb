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

  describe 'procedures' do
    describe 'decrease invest amount' do
      it 'runs procedure' do
        visit '/functions'

        find(:xpath, '//form[contains(@class,"decrease_invest_amount_params")]//option[2]').select_option
        find(:xpath, '//form[contains(@class,"decrease_invest_amount_params")]//input[@type="number"]').set(5_000)
        click_on 'Save Decrease invest amount params'
        expect(page).to have_content 'Procedure IRS.DECREASE_INVEST_AMOUNT was successfully completed.'
      end

      it 'show invalid params alert' do
        visit '/functions'

        find(:xpath, '//form[contains(@class,"decrease_invest_amount_params")]//option[2]').select_option
        click_on 'Save Decrease invest amount params'
        expect(page).to have_content 'IRS.DECREASE_INVEST_AMOUNT: invalid params'
      end

      it 'show oracle error' do
        visit '/functions'

        find(:xpath, '//form[contains(@class,"decrease_invest_amount_params")]//option[2]').select_option
        find(:xpath, '//form[contains(@class,"decrease_invest_amount_params")]//input[@type="number"]').set(55)
        click_on 'Save Decrease invest amount params'

        expect(page).to have_content 'OCIError: ORA-20003: difference must be greater than 1000'
      end
    end

    describe 'recalculate worth' do
      it 'runs procedure' do
        visit '/functions'

        click_on 'Recalculate Worth'
        expect(page).to have_content 'Procedure IRS.RECALCULATE_WORTH was successfully completed.'
      end
    end

    describe 'scale invest amounts' do
      it 'runs procedure' do
        visit '/functions'

        find(:xpath, '//form[contains(@class,"scale_invest_amounts_params")]//option[2]').select_option
        find(:xpath, '//form[contains(@class,"scale_invest_amounts_params")]//input[@type="number"]').set(50)
        click_on 'Save Scale invest amounts params'
        expect(page).to have_content 'Procedure IRS.SCALE_INVEST_AMOUNTS was successfully completed.'
      end

      it 'show invalid params alert' do
        visit '/functions'

        find(:xpath, '//form[contains(@class,"scale_invest_amounts_params")]//option[2]').select_option
        click_on 'Save Scale invest amounts params'
        expect(page).to have_content 'IRS.SCALE_INVEST_AMOUNTS: invalid params'
      end
    end
  end
end