# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters
    before_action :set_token_to_session, only: %i[new create]
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

    def set_token_to_session
      session[:token] = params[:token] unless same_session
    end

    def same_session
      session[:token] || session[:token] == params[:token]
    end

    def check_token_presence
      redirect_to new_user_session_path, alert: 'You need a unique link to Sign Up' unless valid_token?
    end

    def valid_token?
      session[:token] && Invitation.verify_token?(session[:token])
    end

    def destroy_invitation
      Invitation.find_by(token: session[:token]).destroy
    end
  end
end
