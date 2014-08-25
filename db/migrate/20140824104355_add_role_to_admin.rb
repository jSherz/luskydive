# Adds the role field to admins that allows differentiation between committee & superadmins
class AddRoleToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :role, :string
  end
end
