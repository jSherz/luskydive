# Ensures the admin's role cannot be null (empty role allowed)
class MakeAdminRoleNotNullable < ActiveRecord::Migration
  def change
    Admin.where(role: nil).update_all(role: '')

    change_column :admins, :role, :string, null: false, default: ''
  end
end
