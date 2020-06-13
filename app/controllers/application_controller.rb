class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    # before_action :configure_permitted_parameters, if: :devise_controller?
    protect_from_forgery with: :null_session


    def set_current_user
      @current_user = User.find_by(id: session[:user_id])
    end


    def after_sign_in_path_for(resource)

      if kanri_signed_in?
        kanrikanri_posts_path
      else
        root_path # ログイン後に遷移するpathを設定
      end
        
    end

    def after_sign_out_path_for(resource)
        new_user_session_path # ログアウト後に遷移するpathを設定
    end





    # rotected

    # Userの編集画面構築で記述
    # https://easyramble.com/strong-parameters-on-rails-devise.html
    # def devise_parameter_sanitizer
    #     if resource_class == User
    #       User::ParameterSanitizer.new(User, :user, params)
    #     else
    #       super # Use the default one
    #     end
    # end

  def configure_permitted_parameters 

    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email, :password, :password_confirmation,:image,:age, :sex,:insta_id,])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :age, :insta_id,:image])
  end

end
