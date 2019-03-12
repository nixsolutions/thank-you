# frozen_string_literal: true

require_relative './features_helper'

describe 'User see organizations' do
  let(:user) { create :user }

  before { sign_in(user) }

  context 'when index' do
    let!(:organizations) { create_list :organization, 5 }

    before { visit organizations_path }

    it 'includes organizations names' do
      organizations.each do |organization|
        expect(page).to have_content organization.name
      end
    end

    it 'includes organizations descriptions' do
      organizations.each do |organization|
        expect(page).to have_content organization.description
      end
    end

    it 'includes organizations user emails' do
      organizations.each do |organization|
        expect(page).to have_content organization.user.email
      end
    end
  end

  context 'when new' do
    before { visit new_organization_path }

    context 'when valid data' do
      it 'create a new organization' do
        fill_in 'organization_name', with: 'uniq_name'
        fill_in 'organization_description', with: 'uniq_description'
        click_on 'Create'

        expect(page).to have_content 'uniq_name'
      end
    end

    context 'when invalid data' do
      it 'does not create organization' do
        fill_in 'organization_name', with: 'uniq_name'
        click_on 'Create'

        expect(page).to have_content "Description can't be blank"
      end
    end
  end

  context 'when show' do
    let!(:organization) { create :organization }

    before { visit organization_path(organization) }

    it 'includes name' do
      expect(page).to have_content organization.name
    end

    it 'includes description' do
      expect(page).to have_content organization.description
    end

    it 'includes user email' do
      expect(page).to have_content organization.user.email
    end
  end

  context 'when edit' do
    let!(:organization) { create :organization }

    before do
      visit edit_organization_path(organization)

      fill_in 'organization_name', with: 'new_name'
      click_on 'Create'
    end

    context 'when valid data' do
      it 'changes name' do
        expect(page).to have_content 'new_name'
      end

      it 'redirects' do
        expect(page.current_url).to eq(organization_url(organization))
      end
    end

    context 'when invalid data' do
      before do
        visit edit_organization_path(organization)

        fill_in 'organization_name', with: ''
        click_on 'Create'
      end

      it 'not redirects' do
        expect(page.current_url).to eq(organization_url(organization))
      end

      it 'includes errors' do
        expect(page).to have_content "Name can't be blank"
      end
    end
  end

  context 'when destroy' do
    let!(:organization) { create :organization, name: 'uniq_name' }

    before { visit organization_path(organization) }

    it 'redirects' do
      click_on 'Destroy'

      expect(page.current_url).to eq(organizations_url)
    end

    it 'not include organization name' do
      click_on 'Destroy'

      expect(page).not_to have_content organization.name
    end
  end
end
