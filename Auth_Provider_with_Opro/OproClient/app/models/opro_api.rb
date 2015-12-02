class OproApi
  TOKEN_URL = "#{ENV['opro_base_url']}/oauth/token.json"
  API_URL = "#{ENV['opro_base_url']}/api"

  attr_reader :access_token

  def initialize(access_token)
    @access_token = access_token
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
                                  email: "test#{rand(100)}@example.com"
                              },
                              accept: :json))
  end

  class << self
    def authenticate!(code)
      JSON.parse(RestClient.post(TOKEN_URL,
                                 {
                                     client_id: ENV['opro_client_id'],
                                     client_secret: ENV['opro_client_secret'],
                                     code: code
                                 },
                                 accept: :json))
    end

    def refresh!(refresh_token)
      JSON.parse(RestClient.post(TOKEN_URL,
                                 {
                                     client_id: ENV['opro_client_id'],
                                     client_secret: ENV['opro_client_secret'],
                                     refresh_token: refresh_token
                                 },
                                 accept: :json))
    end
  end
end