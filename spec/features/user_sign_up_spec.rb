# frozen_string_literal: true

require_relative './features_helper'

describe 'User Signs Up' do
  let(:user) { build(:user) }

  context 'with unique link' do
    it 'successfully signs up and redirects to a Main Page' do
      invitation = create(:invitation)
      link = "#{sign_up_url}?token=#{invitation.token}"
      sign_up(user, link)
      expect(page).to have_current_path root_path
    end
  end

  context 'without unique link' do
    before { visit new_user_registration_url }

    it 'shows warning message' do
      expect(page).to have_content 'You need a unique link to sign up'
    end
    it 'redirects to a Login Page' do
      expect(page).to have_current_path new_user_session_path
    end
  end
end
