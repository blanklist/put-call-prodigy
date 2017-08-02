class Api::GraphsController < Api::BaseController
  def graph_data
    render json: [{name: @ticker, data: @graph_data}].chart_json
  end
end
