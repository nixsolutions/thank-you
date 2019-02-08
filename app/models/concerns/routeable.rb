# frozen_string_literal: true

module Routeable
  extend ActiveSupport::Concern

  included do
    include Rails.application.routes.url_helpers
  end

  def default_url_options
    Rails.application.config.default_url_options
  end
end