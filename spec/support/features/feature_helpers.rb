# frozen_string_literal: true

module Features
  def sign_in(user)
    visit new_user_session_path
    within '#new_user' do
      fill_in t('email'),    with: user.email
      fill_in t('password'), with: user.password
      click_on t('sign_in')
    end
  end

  def sign_up(user, link)
    visit link
    fill_in t('email'),    with: user.email
    fill_in t('password'), with: user.password
    fill_in t('password_confirmation'), with: user.password
    click_on t('sign_up')
  end
end
