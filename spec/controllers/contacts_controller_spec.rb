# frozen_string_literal: true

require 'rails_helper'

describe 'Contacts Controller', type: :request do
  let(:user) { create :user }

  before { log_in user }

  describe 'POST #create' do
    let(:organization) { create :organization }
    let(:contact_type) { create :contact_type, main_type: 'phone', subtype: 'telegram' }

    let(:data) { { data: '+380505555559', organization_id: organization.id, contact_type_id: contact_type.id } }

    context 'when valid data' do
      before do
        post '/contacts', params: { contact: data }
      end

      it 'creates a new contact' do
        expect do
          post '/contacts', params: { contact: data }
        end.to change(Contact, :count).by(1)
      end
    end

    context 'when invalid data' do
      it 'not create a new contact' do
        expect { post '/contacts', params: { contact: { data: 'data' } } }.not_to change(Contact, :count)
      end

      it 'will render new' do
        post '/contacts', params: { contact: { data: 'data' } }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    let!(:contact) { create :contact }

    it 'will set variable' do
      patch "/contacts/#{contact.id}", params: { contact: { data: '+380505555559' } }
      expect(assigns(:contact)).to eq contact
    end

    context 'when valid data' do
      it 'update contact' do
        patch "/contacts/#{contact.id}", params: { contact: { data: '+380505555559' } }
        contact.reload
        expect(contact.data).to eq '+380505555559'
      end
    end

    context 'when invalid data' do
      before { patch "/contacts/#{contact.id}", params: { contact: { data: '' } } }

      it 'don`t save data to db' do
        contact.reload
        expect(contact.data).to eq attributes_for(:contact)[:data]
      end
    end
  end

  context 'when destroy' do
    let!(:contact) { create :contact }

    it 'change count in db' do
      expect { delete "/contacts/#{contact.id}" }.to change(Contact, :count).by(-1)
    end

    it 'redirects to all organizations' do
      delete "/contacts/#{contact.id}"

      expect(response).to redirect_to organization_path(contact.organization)
    end
  end
end
