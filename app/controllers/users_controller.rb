class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  before_action :set_user,           only: [:index, :show]

  def index
  end

  def show
  end

  private

    def set_user
      @user = current_user
    end
end
