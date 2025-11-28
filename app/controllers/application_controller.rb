class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def logged_in?
    current_user.present?
  end
  helper_method :logged_in?

  def require_user
    redirect_to login_path, alert: "You must be logged in to do that." unless logged_in?
  end

  def require_admin
    redirect_to root_path, alert: "You are not authorized to do that." unless current_user&.admin?
  end
end
