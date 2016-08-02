module ClickTracksHelper
  def stat_by(start_date = nil, end_date = nil)
    start_date ||= 1.month.ago
    start_date = start_date.to_datetime
    end_date ||= Time.current
    end_date = end_date.to_datetime
    line_chart by_day_api_click_track_path(@item, start_date: start_date, end_date: end_date),
               basic_opts('Click count', start_date, end_date)
  end

  private

  def basic_opts(title, start_date, end_date)
    {
        discrete: true,
        library: {
            title: {text: title, x: -20},
            subtitle: {text: "from #{l(start_date, format: :medium)} to #{l(end_date, format: :medium)}", x: -20},
            yAxis: {
                title: {
                    text: 'Count'
                }
            },
            tooltip: {
                valueSuffix: 'click(s)'
            },
            credits: {
                enabled: false
            }
        }
    }
  end
end