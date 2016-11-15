class CreateMedications < ActiveRecord::Migration[5.0]
  def change
    create_table :medications do |t|
      t.string   :generic_name
      t.string   :brand_name
      t.string   :administration_route
      t.string   :dose
      t.string   :dosage_form
      t.string   :doctor
      t.integer  :user_id

      t.timestamps
    end
  end
end
