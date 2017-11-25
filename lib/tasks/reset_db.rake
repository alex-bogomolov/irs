require Rails.root.join('spec', 'helpers.rb')
include FactoryBot::Syntax::Methods
include Helpers

task reset_db: :environment do
  puts 'Resetting DB'
  DatabaseCleaner.strategy = :deletion, {only: %w(investments investors investment_data_copy)}
  DatabaseCleaner.clean
  seed_test_database
  puts 'Finished'
end