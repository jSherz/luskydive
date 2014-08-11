class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :title, limit: 120
      t.text :description
      t.decimal :price, precision: 5, scale: 2
      t.boolean :active
      t.integer :weighting
      t.string :requirements

      t.timestamps
    end
  end
end
