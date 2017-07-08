module StocksHelper
  def stat_by
    line_chart time_interval_api_stocks_path, basic_opts
    #library: {chart: {backgroundColor: "#eee"}}
  end

  private
  def basic_opts
    {
      library: {
        yAxis: {
                  floor: 144, #must change to variable of upper_limit
                  ceiling: 145, #must change to variable of lower_limit
                },
        chart: { backgroundColor: "#eee",
                zoomType: 'xy'
                }
      }
    }
  end
end
