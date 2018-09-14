class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?, :login!

  def login!(user)
    #set current user to user, and put current user's token into browser session
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end

  def current_user
    #set current user or find them by session token
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def require_login
    #direct to new session login page unless they are logged in
    redirect_to new_session_url unless logged_in?
  end

  def logged_in?
    #checks if current_user is nil or not
    !!current_user
  end

  def logout!
    #get new session token
    #doubly sure by nil-ing session token
    current_user.reset_session_token!
    session[:session_token] = nil
  end
end
