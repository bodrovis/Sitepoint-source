class Api::ClickTracksController < Api::BaseController
  def create
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    respond_to do |format|
      format.js
    end
  end

  def by_day
    opts = ['created_at', {range: @start_date..@end_date}]
    method_name = :group_by_day
    if by_year?
      opts[1].merge!({format: '%Y'})
      method_name = :group_by_year
    elsif by_month?
      opts[1].merge!({format: '%b %Y'})
      method_name = :group_by_month
    else
      opts[1].merge!({format: '%d %b'})
    end
    clicks = @click_tracks.send(method_name, *opts).count
    render json: [{name: 'Click count', data: clicks}].chart_json
  end
end