class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery with: :exception

  def user_not_authorized
    flash[:danger] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end
end
