module InvestmentsHelper
  def country_code_from_name(name)
    ISO3166::Country.find_country_by_name(name).alpha2
  end
end
