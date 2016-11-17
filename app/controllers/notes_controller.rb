class NotesController < ApplicationController
  before_action :set_medication, only: [:new, :edit, :update, :show, :destroy]
  before_action :set_note,       only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def set_medication
    @medication = Medication.find_by(params[:id])
  end

    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:content)
    end
end
