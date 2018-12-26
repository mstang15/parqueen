class HomeController <ApplicationController
  def show
    gon.current_user = Base64.encode64(current_user.id.to_s)
  end
end
