class NotesController < ApplicationController
  before_action :authenticate_user!,
                only: [:index, :show, :edit, :create, :update]
  before_action :set_medication, only: [:create]
  before_action :set_note,       only: [:show, :edit, :update, :destroy]
  before_action :set_user,       only: [:show]

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = @medication.notes.build(note_params)
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
    @note.destroy
    flash[:success] = "Note was successfully deleted."
    redirect_to notes_path(@note)
  end

  private

    def set_medication
      @medication = Medication.find_by(params[:id])
    end

    def set_note
      @note = Note.find(params[:id])
    end

    def set_user
      @user = current_user
    end

    def note_params
      params.require(:note).permit(:content)
    end
end
