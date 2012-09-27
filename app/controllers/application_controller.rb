class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  def not_authenticated
    redirect_to login_url, :alert => "First log in to view this page."
  end
  
  helper_method :current_users_list
  protected
  def current_users_list
    current_users.map {|u| u.username.titleize}.join("</li><li>").html_safe
  end
end
