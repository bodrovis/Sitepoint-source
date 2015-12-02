class Oauth::TokensController < Opro::Oauth::TokenController
  def create
    render json: {test: 'test'} and return
    # Find the client application
    application = Opro::Oauth::ClientApp.authenticate(params[:client_id], params[:client_secret])

    if application.present? && (auth_grant = auth_grant_for(application, params)).present?
      auth_grant.refresh!
      render :json => { access_token:  auth_grant.access_token,
                        # http://tools.ietf.org/html/rfc6749#section-5.1
                        token_type:    Opro.token_type || 'bearer',
                        refresh_token: auth_grant.refresh_token,
                        expires_in:    auth_grant.expires_in }
    else
      render_error debug_msg(params, application)
    end
  end
end