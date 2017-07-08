class Api::BaseController < ApplicationController
  before_action :load_data

  private
  def load_data
    stock_data = Stock.new("AAPL", "15min")
    puts '*' * 100
    stock_data.generate
    stock_data.extract_graph_data
    p @stock_data = stock_data.get_week_values
  end
end
