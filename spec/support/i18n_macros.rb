# frozen_string_literal: true

module I18nMacros
  def t(*args)
    I18n.translate!(*args)
  end
end
