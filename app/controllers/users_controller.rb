class UsersController < ApplicationController
  before_action :set_user, only: %i[ show ]

  # GET /:account
  def show
  end

  private

  def set_user
    @user = User.find_by!(account: params[:account])
  end
end
