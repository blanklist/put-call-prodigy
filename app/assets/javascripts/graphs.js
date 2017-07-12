$(document).on('turbolinks:load', function (e) {
  // loadGraph(e);

});

var loadGraph = function(e) {
  e.preventDefault();

  var url = "/api/graphs/graph_data";
  var method = "get";
  var chart_data = { ticker: 'AAPL' };

  $.ajax({
    url: url,
    method: method,
    data: chart_data
  }).done(function (data) {
      // Create the chart
      Highcharts.stockChart('container', {

          rangeSelector: {
              selected: 1
          },

          title: {
              text: 'AAPL Stock Price'
          },

          series: [{
              name: 'AAPL',
              data: data[0].data,
              tooltip: {
                  valueDecimals: 2
              }
          }]
      });
  }).fail(function(data) {
    console.error("Something went wrong", data);
  });
}
