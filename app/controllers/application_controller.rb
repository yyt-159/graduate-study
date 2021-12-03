class ApplicationController < ActionController::Base
    #### ▼ usernameが必要となるようにbefore_actionを設定 ###
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username])
      end
    #### ▲  ###
    # ヘルパーの関数をコントローラーでも使えるようにする
    include ApplicationHelper
end
