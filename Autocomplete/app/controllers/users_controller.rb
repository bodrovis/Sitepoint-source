class UsersController < ApplicationController
  def index
    respond_to do |format|
      if params[:term]
        @users = User.search_by_full_name(params[:term]).with_pg_search_highlight
      else
        @users = User.all
      end
      format.json
      format.html
    end
  end
end