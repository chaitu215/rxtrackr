class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = Identity.find_for_facebook_oath(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to_new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
