FIRST_NAMES = %w(Elsie Rachel Eva Rodolfo Bernice)
LAST_NAMES = %w(Grant Wiegand Graham White Beatty)
EMAILS = %w(izabella@carterlang.org sylvan@zulaufroob.com river@wittingbayer.info aniyah_kulas@lowe.biz macy@mcclure.info)
CITIES = ['Brandynchester', 'Lake Johathanstad', 'Haagbury', 'New Clark', 'Kevinton']

FactoryBot.define do
  sequence(:first_name) { |n| FIRST_NAMES[n - 1] }
  sequence(:last_name) { |n| LAST_NAMES[n - 1] }
  sequence(:email) { |n| EMAILS[n - 1] }
  sequence(:city) { |n| CITIES[n - 1] }

  factory :investor do
    first_name { generate(:first_name) }
    last_name { generate(:last_name) }
    email { generate(:email) }
    city { generate(:city) }
  end
end