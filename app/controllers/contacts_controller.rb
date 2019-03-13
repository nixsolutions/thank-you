# frozen_string_literal: true

class ContactsController < ApplicationController
  before_action :set_contact, only: %i[edit update destroy]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to @contact.organization
    else
      render :new
    end
  end

  def edit; end

  def update
    if @contact.update(contact_params)
      redirect_to @contact.organization
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy
    redirect_to @contact.organization
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:data, :organization_id, :contact_type_id)
  end
end
