class SessionsController <ApplicationController

  def create
    user = User.update_or_create(auth_hash)
    session[:id] = user.id
    redirect_to home_path
  end

  def destroy
  session.clear
    redirect_to root_path
  end

  def auth_hash
    request.env["omniauth.auth"]
  end

end
