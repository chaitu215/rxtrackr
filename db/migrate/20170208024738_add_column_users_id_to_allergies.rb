class AddColumnUsersIdToAllergies < ActiveRecord::Migration[5.0]
  def change
    add_column :allergies, :user_id, :integer
  end
end
