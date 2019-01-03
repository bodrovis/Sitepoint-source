module StatisticsHelper
  def sporters_by_country
    column_chart sporters_by_country_charts_path, library: {
        title: {text: 'Sporters by country', x: -20},
        yAxis: {
            title: {
                text: 'Sporters count'
            }
        },
        xAxis: {
            title: {
                text: 'Country'
            }
        }
    }
  end

  def sporters_by_age
    bar_chart sporters_by_age_charts_path, height: '500px', library: {
        title: {text: 'Sporters by age', x: -20},
        yAxis: {
            allowDecimals: false,
            title: {
                text: 'Ages count'
            }
        },
        xAxis: {
            title: {
                text: 'Age'
            }
        }
    }
  end

  def results_by_country
    column_chart results_by_country_charts_path, stacked: true, height: '500px', library: {
        title: {text: 'Results by country', x: -20},
        yAxis: {
            title: {
                text: 'Count'
            }
        },
        xAxis: {
            title: {
                text: 'Countries and places'
            }
        }
    }
  end

  def competitions_by_year
    line_chart competitions_by_year_charts_path, library: {
        title: {text: 'Competitions by year', x: -20},
        yAxis: {
            crosshair: true,
            title: {
                text: 'Competitions count'
            }
        },
        xAxis: {
            crosshair: true,
            title: {
                text: 'Year'
            }
        }
    }
  end
end