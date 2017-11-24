json.extract! investment, :id, :name, :address, :city, :country, :min_invest_amount, :max_invest_amount, :max_total_invest_amount, :marked, :created_at, :updated_at
json.url investment_url(investment, format: :json)
