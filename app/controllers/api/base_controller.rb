class Api::BaseController < ApplicationController
  before_action :load_data

  private
  def load_data
    @ticker = params[:ticker]
    @graph_data = GraphData.new.graph_stock(@ticker, "1min")
  end
end
