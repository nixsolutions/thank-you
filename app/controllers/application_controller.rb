# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def user_registration_url_method
    method(:new_user_registration_url)
  end
end
