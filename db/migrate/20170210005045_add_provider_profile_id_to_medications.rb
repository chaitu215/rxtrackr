class AddProviderProfileIdToMedications < ActiveRecord::Migration[5.0]
  def change
    add_column :medications, :provider_profile_id, :integer
  end
end
