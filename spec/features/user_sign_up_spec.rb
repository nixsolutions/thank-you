# frozen_string_literal: true

require_relative './features_helper'

describe 'User Signs Up' do
  it 'successfully' do
    user = build(:user)
    sign_up(user)
    expect(page).to have_current_path root_path
  end
end
