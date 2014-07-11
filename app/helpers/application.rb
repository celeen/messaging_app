helpers do

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def signed_in?
    !current_user.nil?
  end

  def access_denied
    session[:error] = "You need to log in first."
    redirect to("/sign_in")
  end

end
