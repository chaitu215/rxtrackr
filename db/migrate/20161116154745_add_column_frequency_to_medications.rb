class AddColumnFrequencyToMedications < ActiveRecord::Migration[5.0]
  def change
    add_column :medications, :frequency, :string
  end
end
