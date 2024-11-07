class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :update, :destroy]

  def index
    @invitations = Invitation.all
    render json: @invitations
  end

  def show
    render json: @invitation
  end

  def create
    @invitation = Invitation.new(invitation_params)

    if @invitation.save
      render json: @invitation, status: :created
    else
      render json: @invitation.errors, status: :unprocessable_entity
    end
  end

  def update
    if @invitation.update(invitation_params)
      render json: @invitation, status: :ok
    else
      render json: @invitation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @invitation.destroy
    head :no_content
  end

  private

  def set_invitation
    @invitation = Invitation.find(params[:id])
  end

  def invitation_params
    params.require(:invitation).permit(:event_id, :user_id, :status)
  end
end
