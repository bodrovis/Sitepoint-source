class PagesController < ApplicationController
  def index
    begin
      1 / 0
    rescue Exception => e
      Raygun.track_exception(e, custom_data: {my: 'I tried to do some zero division. How cool is that?'})
    end
  end
end