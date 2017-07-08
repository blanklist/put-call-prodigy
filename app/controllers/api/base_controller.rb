class Api::BaseController < ApplicationController
  before_action :load_data

  private
  def load_data
    @graph_data = GraphData.new.graph_stock(params[:ticker], "15min")
  end
end
