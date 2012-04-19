class OmniauthCallbacksController <  Devise::OmniauthCallbacksController

  def google_oauth2
     info = request.env["omniauth.auth"]["info"]
     @user = User.find_by_email(info.email.downcase)
     if @user.nil?
       flash[:notice] = "No user found for #{info.email}"
       redirect_to root_path
     else
       sign_in_and_redirect @user
     end
  end

end