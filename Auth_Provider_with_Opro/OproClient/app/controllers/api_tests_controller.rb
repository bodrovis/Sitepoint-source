class ApiTestsController < ApplicationController
  def index
    redirect_to root_path and return unless session[:access_token]
    @response = JSON.parse RestClient.get("#{ENV['opro_base_url']}/oauth_tests/show_me_the_money.json",
                                          params: {
                                              access_token: session[:access_token]
                                          },
                                          accept: :json)
  end
end