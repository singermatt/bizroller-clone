class OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def all
		
		user = User.from_omniauth(request.env["omniauth.auth"])
	    if user.persisted?
	      flash.notice = "Signed in!"
	      sign_in_and_redirect user
	    #  if current_user.created_at > Time.now - 2.minutes
		#	 @user = user
        #    SignupMailer.signup_confirmation(@user).deliver
        #  end
	    else
	      session["devise.user_attributes"] = user.attributes
	      redirect_to new_user_registration_url
	    end
	end
	alias_method :linkedin, :all

end
