# Adds the object changes table to recorded versions
class AddObjectChangesToVersions < ActiveRecord::Migration
  def change
    add_column :versions, :object_changes, :text
  end
end
