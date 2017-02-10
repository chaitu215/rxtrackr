class CreateProviderProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :provider_profiles do |t|
      t.string   :name
      t.integer  :medication_id
      t.integer  :user_id
      t.string   :website
      t.string   :telephone
      t.string   :address

      t.timestamps
    end
  end
end
