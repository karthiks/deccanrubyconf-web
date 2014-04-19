module DeviseTokenAuthenticable
  module Controller
    extend ActiveSupport::Concern

    included do
      before_filter :authenticate_user_from_token!
      before_filter :authenticate_user!
    end

    def authenticate_user_from_token!
      user_email = params[:email].presence
      auth_token = request.headers['X-Auth-Token'].presence

      user = user_email && User.find_by_email(user_email)

      if user && Devise.secure_compare(user.authentication_token, auth_token)
        sign_in user, store: false
      else
        unauthorized_action and return
      end
    end

    def unauthorized_action(error_message = "Unauthorized action")
      render json: { error: error_message }, status: :unauthorized
    end

  end
end
