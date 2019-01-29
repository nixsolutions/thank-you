# frozen_string_literal: true

require_relative './features_helper'

describe 'User Signs In' do
  context 'when authenticated user' do
    let(:user) { create(:user) }

    it 'signs in successfully' do
      sign_in(user)
      expect(page).to have_content 'Signed in successfully.'
    end
  end

  context 'when non authenticated user in should does not sign in and' do
    let(:user) { build(:user) }

    before { sign_in(user) }

    it 'show "Invalid Email or password." message' do
      expect(page).to have_content 'Invalid Email or password.'
    end

    it 'current page should be login page' do
      expect(page).to have_current_path new_user_session_path
    end
  end
end
