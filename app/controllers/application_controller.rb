# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale

  private

  def default_url_options
    { locale: I18n.locale }.merge(super)
  end

  def set_locale
    I18n.locale = extract_locale
  end

  def extract_locale
    parsed_locale = params[:locale]
    return parsed_locale if I18n.available_locales.map(&:to_s).include?(parsed_locale)

    extract_locale_from_header || I18n.locale
  end

  def extract_locale_from_header
    request.env['HTTP_ACCEPT_LANGUAGE']&.scan(/[a-z]{2}/)&.map(&:to_sym)&.find do |locale|
      I18n.available_locales.map(&:to_s).include?(locale)
    end
  end
end
