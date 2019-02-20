# frozen_string_literal: true

module DeviseSharedHelper
  def devise_registerable?
    devise_mapping.registerable? && controller_name != 'registrations'
  end

  def devise_recoverable?
    devise_mapping.recoverable? && controller_name != 'passwords' && controller_name != 'registrations'
  end

  def devise_confirmable?
    devise_mapping.confirmable? && controller_name != 'confirmations'
  end

  def devise_lockable?
    devise_mapping.lockable? && resource_class.unlock_strategy_enabled?(:email) && controller_name != 'unlocks'
  end

  def omniauth_link(provider)
    link_to "Sign in with #{OmniAuth::Utils.camelize(provider)}", omniauth_authorize_path(resource_name, provider)
  end
end
