class GraphData

  def initialize
    @graph_values = {}
  end

  def graph_stock(ticker, time_interval)
    stock = Stock.new(ticker, time_interval)
    @stock_raw = stock.generate
    extract_data
    @graph_values
  end

  private
  def extract_data
    @stock_raw.each do |k,v|
      @graph_values[k] = v["4. close"]
    end
  end

  def get_week_values
    @graph_values.select { |date, _| date > 1.week.ago && date < Time.current }
  end

end
