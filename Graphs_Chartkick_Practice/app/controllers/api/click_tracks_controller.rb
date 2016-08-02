class Api::ClickTracksController < Api::BaseController
  def create
    respond_to do |format|
      format.js
    end
  end

  def by_day
    opts = ['created_at', {range: @start_date..@end_date, format: '%d %b'}]
    method_name = :group_by_day
    if by_year?
      opts[1].merge!({format: '%Y'})
      method_name = :group_by_year
    elsif by_month?
      opts[1].merge!({format: '%b %Y'})
      method_name = :group_by_month
    end
    clicks = @click_tracks.send(method_name, *opts).count
    render json: [{name: 'Click count', data: clicks}].chart_json
  end
end