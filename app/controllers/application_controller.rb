class ApplicationController < ActionController::Base
  protect_from_forgery

  # root homepage
  def index
  end

  def private
    authenticate_user!
    render nothing: true
  end
end
