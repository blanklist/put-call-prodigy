module StocksHelper
  def stat_by
    line_chart time_interval_api_stocks_path
  end
end
