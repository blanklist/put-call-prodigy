class Api::GraphsController < Api::BaseController
  # def create
  #   respond_to do |format|
  #     format.json
  #   end
  # end

  def graph_data
    puts "*" * 100
    puts "It went here"

    p @graph_data
    render json: [{name: @ticker, data: @graph_data}].chart_json
  end
end
