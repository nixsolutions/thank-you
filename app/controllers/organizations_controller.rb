# frozen_string_literal: true

class OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[edit show update destroy]

  def index
    @organizations = Organization.all.includes(:user)
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params.merge(user: current_user))

    if @organization.save
      redirect_to @organization
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @organization.update(organization_params)
      redirect_to @organization
    else
      render :edit
    end
  end

  def destroy
    @organization.destroy

    redirect_to organizations_path
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :description)
  end

  def set_organization
    @organization = Organization.find(params[:id])
  end
end
