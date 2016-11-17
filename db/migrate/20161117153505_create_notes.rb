class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.text :content
      t.references :medication, foreign_key: true

      t.timestamps
    end
    add_index :notes, [:medication_id, :created_at]
  end
end
