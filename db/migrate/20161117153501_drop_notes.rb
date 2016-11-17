class DropNotes < ActiveRecord::Migration[5.0]
  def change
    drop_table :notes
  end
end
