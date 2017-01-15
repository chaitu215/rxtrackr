class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :user_notes]
  before_action :set_user,           only: [:index, :show, :user_notes]

  def index
  end

  def show
  end

  def user_notes
    @notes = @user.notes.all
  end

  private

    def set_user
      @user = current_user
    end
end
