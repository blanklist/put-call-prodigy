class Api::StocksController < Api::BaseController
  def create
    respond_to do |format|
      format.js
    end
  end

  def time_interval
    render json: [{name: 'AAPL', data: @stock_data}].chart_json
  end
end
