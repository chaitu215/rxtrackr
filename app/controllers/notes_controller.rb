class NotesController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_user!,
                only: [:index, :show, :edit, :create, :update]
  before_action :set_note,       only: [:index, :show, :edit, :update, :destroy]
  before_action :set_user,       only: [:show, :destroy]
  before_action :set_medication, only: [:index, :show, :new]

  def index
    @notes = @medication.notes.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.create(note_params)
    if @note.save
      flash[:success] = "Note was successfully added."
      redirect_to @note
    else
      render :new
    end
  end

  def edit
  end

  def update
    @note.update(note_params)
    if @note.save
      flash[:success] = "Note was successfully edited."
      redirect_to @note
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @medication = @note.medication
    @note.destroy
    flash[:success] = "Note was successfully deleted."
    redirect_to @medication
  end

  private

    def set_note
      @note = Note.find_by(params[:medication_id])
    end

    def set_user
      @user = current_user
    end

    def set_medication
      @medication = Medication.find(params[:medication_id])
    end

    def note_params
      params.require(:note).permit(:content, :medication_id)
    end
end
