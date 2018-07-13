class ChangeDefaultRoleParticipants < ActiveRecord::Migration[5.1]
  def change
    change_column :participants, :role, :integer, default: 0
  end
end
