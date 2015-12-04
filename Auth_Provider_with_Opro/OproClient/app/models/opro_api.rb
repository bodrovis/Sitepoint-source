class OproApi
  TOKEN_URL = "#{ENV['opro_base_url']}/oauth/token.json"
  API_URL = "#{ENV['opro_base_url']}/api"

  attr_reader :access_token, :refresh_token, :email, :password

  def initialize(access_token: nil, refresh_token: nil, email: nil, password: nil)
    @access_token = access_token
    @refresh_token = refresh_token
    @email = email
    @password = password
  end

  def authenticate!(code)
    return if access_token
    JSON.parse(RestClient.post(TOKEN_URL,
                               {
                                   client_id: ENV['opro_client_id'],
                                   client_secret: ENV['opro_client_secret'],
                                   code: code
                               },
                               accept: :json))
  end

  def authenticate_with_email!
    return unless email && password
    JSON.parse(RestClient.post(TOKEN_URL,
                               {
                                   client_id: ENV['opro_client_id'],
                                   client_secret: ENV['opro_client_secret'],
                                   email: email,
                                   password: password
                               },
                               accept: :json))
  end

  def refresh!
    return unless refresh_token
    JSON.parse(RestClient.post(TOKEN_URL,
                               {
                                   client_id: ENV['opro_client_id'],
                                   client_secret: ENV['opro_client_secret'],
                                   refresh_token: refresh_token
                               },
                               accept: :json))
  end

  def test_api
    JSON.parse(RestClient.get("#{ENV['opro_base_url']}/oauth_tests/show_me_the_money.json",
                              params: {
                                  access_token: access_token
                              },
                              accept: :json))

  end

  def get_user(id)
    JSON.parse(RestClient.get("#{API_URL}/users/#{id}.json",
                              params: {
                                  access_token: access_token
                              },
                              accept: :json))
  end

  def update_user(id)
    JSON.parse(RestClient.patch("#{API_URL}/users/#{id}.json",
                                {
                                    access_token: access_token,
                                    ip: "#{rand(100)}.1.1.1"
                                },
                                accept: :json))
  end
end