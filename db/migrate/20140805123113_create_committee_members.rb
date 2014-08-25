# Creates the table that stores committee members
class CreateCommitteeMembers < ActiveRecord::Migration
  def change
    create_table :committee_members do |t|
      t.string :name
      t.string :role
      t.integer :weighting
      t.string :image

      t.timestamps
    end
  end
end
