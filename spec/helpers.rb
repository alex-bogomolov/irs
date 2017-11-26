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
      investment_data = []

      investments.each_with_index do |investment, i|
        investors.each_with_index do |investor, j|
          investment_data << create(:investment_data, investor_id: investor.id,
                                                      investment_id: investment.id,
                                                      invest_amount: invest_amounts[i][j])
        end
      end

      investment_data.each_with_index do |id, i|
        next unless i % 4 == 0
        create(:investment_data_copy, investor_id: id.id,
                                      investment_id: id.id,
                                      investment_date: id.investment_date,
                                      invest_amount: id.invest_amount)
      end
    end
  end
end