module GraphsHelper
  def get_graph
    line_chart time_interval_api_graphs_path, basic_opts
  end

  private
  def basic_opts
    {
      library: {
        title: {
          text: "AAPL",
          x: -20
        },
        subtitle: {
          text: "as of #{l(Time.now, format: :us_date)}", x: -20
        },
        tooltip: {
                    valueSuffix: 'click(s)'
        },
        yAxis: {
                  floor: 140, #must change to variable of upper_limit
                  ceiling: 150, #must change to variable of lower_limit
                  title: {
                    text: 'Price Per Share'
                  }
        },
        xAxis: {
                type: 'datetime',
                dateTimeLabelFormats: {
                    day: '%d %B'
                }
        },
        chart: {
                  zoomType: 'xy',
                  panning: true,
                  panKey: 'shift'
        }
      }
    }
  end
end
