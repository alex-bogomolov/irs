FactoryBot.define do
  first_names = %w(Elsie Rachel Eva Rodolfo Bernice)
  last_names = %w(Grant Wiegand Graham White Beatty)
  emails = %w(izabella@carterlang.org sylvan@zulaufroob.com river@wittingbayer.info aniyah_kulas@lowe.biz macy@mcclure.info)
  cities = ['Brandynchester', 'Lake Johathanstad', 'Haagbury', 'New Clark', 'Kevinton']
  company_names = ['Kshlerin Group', 'Jacobs Group', "O'Hara-Yundt"]
  addresses = ['63361 Dariana Bypass', '5158 Joana Light', '2210 Stewart Extension']
  company_cities = ['Brandynchester', 'Lake Johathanstad', 'Haagbury', 'New Clark', 'Kevinton']
  countries = %w(Mauritania Bhutan Nigeria)
  min_invest_amounts = [25000, 30000, 15000]
  max_invest_amounts = [50000, 60000, 35000]
  max_total_invest_amounts = [250000, 500000, 350000]
  marked = [1, 0, 0]

  sequence(:first_name) { |n| first_names[n - 1] }
  sequence(:last_name) { |n| last_names[n - 1] }
  sequence(:email) { |n| emails[n - 1] }
  sequence(:city) { |n| cities[n - 1] }
  sequence(:company_names) { |n| company_names[n - 1] }
  sequence(:address) { |n| addresses[n - 1] }
  sequence(:company_city) { |n| company_cities[n - 1] }
  sequence(:country) { |n| countries[n - 1] }
  sequence(:min_invest_amount) { |n| min_invest_amounts[n - 1] }
  sequence(:max_invest_amount) { |n| max_invest_amounts[n - 1] }
  sequence(:max_total_invest_amount) { |n| max_total_invest_amounts[n - 1] }
  sequence(:marked) { |n| marked[n - 1] }

  factory :investor do
    first_name { generate(:first_name) }
    last_name { generate(:last_name) }
    email { generate(:email) }
    city { generate(:city) }
  end

  factory :investment do
    name { generate(:company_names) }
    address { generate(:address) }
    city { generate(:company_city) }
    country { generate(:country) }
    min_invest_amount { generate(:min_invest_amount) }
    max_invest_amount { generate(:max_invest_amount) }
    max_total_invest_amount { generate(:max_total_invest_amount) }
    marked { generate(:marked) }
  end
end