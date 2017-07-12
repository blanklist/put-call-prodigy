class GraphData

  def initialize
    @graph_values = []
  end

  def graph_stock(ticker, time_interval)
    stock = Stock.new(ticker, time_interval)
    @stock_raw = stock.generate
    # p @stock_raw
    extract_data
    @graph_values.sort!
  end

  private
  def extract_data
    @stock_raw.each do |k,v|
      ms = string_to_milliseconds(k)
      @graph_values << [ms, v["4. close"].to_f]
    end
    # p @graph_values
  end

  def string_to_milliseconds(str)
    time_arr = str.scan(/\d+/).map(&:to_i)
    Time.new(time_arr[0], time_arr[1], time_arr[2], time_arr[3], time_arr[4]).to_i * 1000
    # Time.new(time_arr[0], time_arr[1], time_arr[2]).to_i * 1000
    # p time_arr
  end

end
