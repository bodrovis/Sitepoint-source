class Api::VideoCallbacksController < ActionController::Base
  def create
    type = params['event_type']
    respond_to do |format|
      @result = if type == 'video_ready'
                  Video.from_api(params['data']['video'])
                else
                  if type == 'video_approve' || type == 'video_delete'
                    video = Video.find_by(uid: params['data']['video']['token'])
                    if video
                      type == 'video_approve' ?
                          video.approve! :
                          video.destroy
                    end
                  else
                    true
                  end
                end
      format.html { @result ? head(:no_content) : head(500) }
    end
  end
end