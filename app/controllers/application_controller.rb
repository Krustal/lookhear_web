class ApplicationController < ActionController::Base
  protect_from_forgery

  # root homepage
  def index
  end

  def after_sign_in_path_for(resource)
    tours_path
  end

  def private
    authenticate_user!
    render nothing: true
  end
end
