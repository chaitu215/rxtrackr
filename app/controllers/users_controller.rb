class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]

  def index
  end

  def show
    @user = User.find(params[:id])
  end
end
