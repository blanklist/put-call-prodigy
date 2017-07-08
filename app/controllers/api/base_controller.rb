class Api::BaseController < ApplicationController
  before_action :load_data

  private
  def load_data
    stock_data = Stock.new("AAPL", "15min")
    puts '*' * 100
    stock_data.generate
    stock_data.extract_graph_data
    @stock_data = stock_data.graph_values
  end
end
