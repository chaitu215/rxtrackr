class CreateUserAllergies < ActiveRecord::Migration[5.0]
  def change
    create_table :user_allergies do |t|
      t.integer  :user_id
      t.integer  :allergy_id
    end
  end
end
