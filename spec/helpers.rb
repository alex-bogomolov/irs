module Helpers

  def seed_test_database
    invest_amounts = [
        [29000, 34000, 29000, 29000, 39000],
        [32000, 38000, 46000, 40000, 48000],
        [19000, 16000, 26000, 15000, 15000]
    ]

    FactoryBot.reload

    Investor.transaction do
      investors = create_list(:investor, 5)
      investments = create_list(:investment, 3)

      investments.each_with_index do |investment, i|
        investors.each_with_index do |investor, j|
          create(:investment_data, investor_id: investor.id,
                 investment_id: investment.id,
                 invest_amount: invest_amounts[i][j])
        end
      end
    end
  end
end