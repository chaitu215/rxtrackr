module ApplicationHelper
  def find_note
    @medication = Medication.find_by(params[:id])
    @note = @medication.notes.first
  end
end
