class User::OmniauthCallbacksController < Devise::OmniauthCallbacksController

    def facebook
           @user = User.find_for_facebook_oauth{
           request.env["omniauth.outh"]
           }
           if @user.persisted?
           flash[:notice] = "Has ingreaso via facebook"
           sing_in_and_redirect @user, :event=> :autentication
           else
           redirect_to new_user_registration_url
           end
       end
   end
   