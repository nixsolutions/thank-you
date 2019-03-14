# frozen_string_literal: true

require 'rails_helper'

describe 'Organizations Controller', type: :request do
  let(:user) { create :user }

  before { log_in user }

  context 'when index' do
    let!(:organizations) { create_list :organization, 5 }

    before { get '/en/organizations' }

    it { expect(response).to render_template :index }
    it { expect(assigns(:organizations)).to match_array(organizations) }
  end

  context 'when show' do
    let!(:organization) { create :organization }

    before { get "/en/organizations/#{organization.id}" }

    it { expect(response).to render_template :show }
    it { expect(assigns(:organization)).to match(organization) }
  end

  describe 'POST #create' do
    context 'when valid data' do
      before do
        post '/en/organizations', params: { organization: attributes_for(:organization) }
      end

      it 'creates a new organization' do
        expect do
          post '/en/organizations', params: { organization: attributes_for(:organization) }
        end.to change(Organization, :count).by(1)
      end
    end

    context 'when invalid data' do
      it 'not create a new Organization' do
        expect do
          post '/en/organizations', params: { organization: { name: 'name' } }
        end.not_to change(Organization, :count)
      end

      it 'will render new' do
        post '/en/organizations', params: { organization: { name: 'name' } }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    let!(:organization) { create :organization }

    it 'will set variable' do
      patch "/en/organizations/#{organization.id}", params: { organization: { name: 'MyString' } }
      expect(assigns(:organization)).to eq organization
    end

    context 'when valid data' do
      it 'update organization' do
        patch "/en/organizations/#{organization.id}", params: { organization: { name: 'new_name' } }
        organization.reload
        expect(organization.name).to eq 'new_name'
      end
    end

    context 'when invalid data' do
      before { patch "/en/organizations/#{organization.id}", params: { organization: { name: '' } } }

      it 'don`t save data to db' do
        organization.reload
        expect(organization.name).to eq attributes_for(:organization)[:name]
      end
    end
  end

  context 'when destroy' do
    let!(:organization) { create :organization }

    it 'change count in db' do
      expect { delete "/en/organizations/#{organization.id}" }.to change(Organization, :count).by(-1)
    end

    it 'redirects to all organizations' do
      delete "/en/organizations/#{organization.id}"

      expect(response).to redirect_to organizations_path
    end
  end
end
