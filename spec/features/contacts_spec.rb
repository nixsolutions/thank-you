# frozen_string_literal: true

require_relative './features_helper'

describe 'User see contacts' do
  let(:user) { create :user }

  before { sign_in(user) }

  context 'when contacts' do
    let!(:organization) { create :organization }
    let!(:contact) { create :contact, organization: organization }

    before { visit organization_path(organization) }

    it 'includes contacts data' do
      expect(page).to have_content contact.data
    end

    it 'includes contacts main_type' do
      expect(page).to have_content contact.contact_type.main_type
    end

    it 'includes contacts subtype' do
      expect(page).to have_content contact.contact_type.subtype
    end
  end

  context 'when new' do
    let!(:contact_type) { create :contact_type, main_type: 'phone', subtype: 'telegram' }
    let!(:organization) { create :organization }

    before { visit new_contact_path }

    context 'when valid data' do
      it 'create a new contact' do
        fill_in 'contact_data', with: attributes_for(:contact)[:data]
        page.select contact_type.main_type.to_s, from: 'contact_contact_type_id'
        page.select organization.name.to_s, from: 'contact_organization_id'
        click_on 'Create'

        expect(page).to have_content attributes_for(:contact)[:data]
      end
    end

    context 'when invalid data' do
      it 'does not create contact' do
        click_on 'Create'

        expect(page).to have_content "Data can't be blank"
      end
    end
  end

  context 'when edit' do
    let!(:contact) { create :contact }
    let!(:organization) { contact.organization }

    before do
      visit edit_contact_path(contact)

      fill_in 'contact_data', with: '+380999999999'
      click_on 'Create'
    end

    context 'when valid data' do
      it 'changes data' do
        expect(page).to have_content '+380999999999'
      end

      it 'redirects' do
        expect(page.current_url).to eq(organization_url(organization))
      end
    end

    context 'when invalid data' do
      before do
        visit edit_contact_path(contact)

        fill_in 'contact_data', with: ''
        click_on 'Create'
      end

      it 'not redirects' do
        expect(page.current_url).to eq(contact_url(contact))
      end

      it 'includes errors' do
        expect(page).to have_content "Data can't be blank"
      end
    end
  end

  context 'when destroy' do
    let!(:contact) { create :contact }
    let!(:organization) { contact.organization }

    before do
      visit organization_path(organization)
    end

    it 'redirects' do
      find(".delete_contact_#{contact.id}").click

      expect(page.current_url).to eq(organization_url(organization))
    end

    it 'not include contact data' do
      find(".delete_contact_#{contact.id}").click

      expect(page).not_to have_content contact.data
    end
  end
end
