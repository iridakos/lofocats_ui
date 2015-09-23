class ApplicationController < ActionController::Base
  protect_from_forgery :with => :exception

  # Set current user's authentication token
  around_filter :set_api_authentication_token

  # UI should be in sync with the API's authorization rules.
  # On access denied by CanCan, redirect user to root/new session path
  # depending on whether he/she was already signed in or not.
  rescue_from CanCan::AccessDenied do
    if is_user_signed_in?
      flash[:error] = 'Sorry, you are not authorized to that.'
      redirect_to root_path
    else
      flash[:warning] = 'Sorry, you need to sign in to do that.'
      redirect_to new_sessions_path(:return_to => request.url)
    end
  end

  # CanCan's ability should handle unauthorized action but
  # in case API rules change, handle it accordingly.
  rescue_from RestClient::Unauthorized do
    redirect_to root_path, :alert => 'Sorry, you are not allowed to do that.'
  end

  # Resolves current user.
  def current_user
    @current_user ||= (User.new(session[:user_information]) if session[:user_information].present?)
  end
  helper_method :current_user

  # Checks whether the user is signed in and his/her token hasn't expired.
  def is_user_signed_in?
    current_user.present? && current_user.authentication_token_expires_at.try(:>, DateTime.now)
  end
  helper_method :is_user_signed_in?

  private

  # Configure Api::Resource to use current user's token when consuming the API
  def set_api_authentication_token
    begin
      Api::Configuration.current_authentication_token = session[:user_information][:authentication_token] if is_user_signed_in?
      yield
    ensure
      # Always nullify the token after each action.
      Api::Configuration.current_authentication_token = nil
    end
  end
end
