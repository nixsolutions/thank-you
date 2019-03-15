# frozen_string_literal: true

I18n::Backend::Simple.include(I18n::Backend::Pluralization)
I18n.backend.store_translations :uk, i18n: {
  plural: {
    rule: lambda do |n|
            case n
            when 0
              :zero
            when 1
              :one
            when 2, 3, 4
              :few
            else
              :other
            end
          end
  }
}

I18n.available_locales = %i[en uk]
I18n.default_locale = :en
