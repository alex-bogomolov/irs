json.extract! investment_data, :id, :investor_id, :investment_id, :investment_date, :invest_amount, :created_at, :updated_at
json.url investment_data_url(investment_data, format: :json)
