# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require_relative '../app/models/equity'

equities = ['TSLA', 'GOOGL', 'AAPL', 'FB', 'TWTR']

unless Equity.exists?

  equities.each do |equity|
    Equity.create(ticker: equity)
  end

  Equity.update(1, company_name: "Tesla, Inc.", description: "Tesla, Inc. is an American automaker, energy storage company, and solar panel manufacturer based in Palo Alto, California.")
  Equity.update(2, company_name: "Alphabet, Inc.", description: "Alphabet Inc. is an American multinational conglomerate created in a corporate restructuring on October 2, 2015. It is the parent company of Google and several former Google subsidiaries.")
  Equity.update(3, company_name: "Apple Inc.", description: "Apple Inc. is an American multinational technology company headquartered in Cupertino, California that designs, develops, and sells consumer electronics, computer software, and online services.")
  Equity.update(4, company_name: "Facebook Inc.", description: "Facebook is an American for-profit corporation and an online social media and social networking service based in Menlo Park, California.")
  Equity.update(5, company_name: "Twitter Inc.", description: "Twitter is an online news and social networking service where users post and interact with messages, 'tweets', restricted to 140 characters.")
end

equities.each do |equity|
  Equity.find_by(:ticker => equity).update_attributes(:roc => Equity.get_roc(equity))
  p equity + " roc loaded"
end

equities.each do |equity|
  Equity.find_by(:ticker => equity).update_attributes(:rsi => Equity.get_rsi(equity))
  p equity + " rsi loaded"
end

equities.each do |equity|
  Equity.find_by(:ticker => equity).update_attributes(:mfi => Equity.get_mfi(equity))
  p equity + " mfi loaded"
end

equities.each do |equity|
  Equity.find_by(:ticker => equity).update_attributes(:adx => Equity.get_adx(equity))
  p equity + " adx loaded"
end

equities.each do |equity|
  Equity.find_by(:ticker => equity).update_attributes(:obv => Equity.get_obv(equity))
  p equity + " obv loaded"
end

equities.each do |equity|
  Equity.find_by(:ticker => equity).update_attributes(:sma => Equity.get_sma(equity))
  p equity + " sma loaded"
end

equities.each do |equity|
  Equity.find_by(:ticker => equity).update_attributes(:ema => Equity.get_ema(equity))
  p equity + " ema loaded"
end

equities.each do |equity|
  Equity.find_by(:ticker => equity).update_attributes(:stoch_d => Equity.get_stoch_d(equity))
  p equity + " stoch_d loaded"
end

equities.each do |equity|
  Equity.find_by(:ticker => equity).update_attributes(:stoch_k => Equity.get_stoch_k(equity))
  p equity + " stoch_k loaded"
end
