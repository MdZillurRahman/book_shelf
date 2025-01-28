class ApplicationController < ActionController::Base
  before_action :set_current_user
  helper_method :current_user, :user_signed_in?

  private

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end    
  end

  def user_signed_in?
    @current_user.present?
  end
end
