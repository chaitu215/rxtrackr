class NotesController < ApplicationController
  before_action :authenticate_user!,
                only: [:index, :show, :destroy, :edit, :create, :update]
  before_action :set_medication, only: [:create]
  before_action :set_note,       only: [:show, :edit, :update]

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = @medication.notes.build(note_params)
    if @note.save
      redirect_to @note,
      notice: "Note was successfully added."
    else
      render :new, notice: "Please try again."
    end
  end

  def edit
  end

  def update
    @note.update(note_params)
    if @note.save
      redirect_to @note,
        notice: "Note was successfully edited."
    else
      render :edit, notice: "Please try again."
    end
  end

  def show
  end

  def destroy
    note = Note.find_by(params[:id])
    note.destroy
    redirect_to notes_path(note),
      notice: "Note was successfully deleted."
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
