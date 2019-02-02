# frozen_string_literal: true

module Features
  def sign_in(user)
    visit new_user_session_path
    fill_in 'Email',    with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
  end

  def sign_up(user, link)
    visit link
    fill_in 'Email',    with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_on 'Sign up'
  end

  def sign_up_url
    "#{ENV['LOCALHOST']}/users/sign_up"
  end
end
3
