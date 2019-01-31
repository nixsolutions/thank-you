# frozen_string_literal: true

require_relative './features_helper'

describe 'User Signs Up' do
  let(:user) { build(:user) }

  context 'with unique link' do
    it 'successfully signs up and redirects to a Main Page' do
      invitation = create(:invitation)
      link = "#{new_user_registration_url}?token=#{invitation.token}"
      sign_up(user, link)
      expect(page).to have_current_path root_path
    end
  end

  context 'without unique link' do
    it 'shows warning message' do
      visit new_user_registration_url
      expect(page).to have_content 'You need a unique link to Sign Up'
    end
    it 'redirects to a Login Page' do
      visit new_user_registration_url
      expect(page).to have_current_path new_user_session_path
    end
  end
end
