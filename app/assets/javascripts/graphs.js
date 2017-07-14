$(document).on('turbolinks:load', function (e) {
  changeGraph(e);
});

var changeGraph = function(e) {
  $('.stockbox').find('a').on('click', function(e){
    $ticker = $(this).text()

    console.log($ticker);
    var url = "/api/graphs/graph_data";
    var method = "get";
    var chart_data = { ticker: $ticker };

    $.ajax({
      url: url,
      method: method,
      data: chart_data
    }).done(function (data) {
        // Create the chart
        Highcharts.stockChart('container', {

            chart: {
              width: 600
            },

            rangeSelector: {
                selected: 1
            },

            title: {
                text: $ticker + ' Stock Price'
            },

            series: [{
                name: $ticker,
                data: data[0].data,
                tooltip: {
                    valueDecimals: 2
                }
            }]
        });
    }).fail(function(data) {
      console.error("Something went wrong", data);
    }).always(function() {
       $("#graph").show();
       $("#mentor-robot").hide();
       $("#instructions").remove();
       $("#ohhey").remove();

    });
  });
};
