# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters
    before_action :check_token_presence, only: %i[new create]

    after_action :destroy_invitation, only: :create

    def new
      super
    end

    def create
      super
    end

    private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:token])
    end

    def check_token_presence
      redirect_to new_user_session_path, alert: 'You need a unique link to sign up.' unless valid_token?
    end

    def valid_token?
      Invitation.verify_token?(params[:token])
    end

    def destroy_invitation
      return unless user_signed_in?

      Invitation.find_by(token: params[:token]).destroy
    end
  end
end
