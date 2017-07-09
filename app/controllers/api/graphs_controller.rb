class Api::GraphsController < Api::BaseController
  def create
    respond_to do |format|
      format.js
    end
  end

  def graph_data
    render json: [{name: @ticker, data: @graph_data}].chart_json
  end
end
