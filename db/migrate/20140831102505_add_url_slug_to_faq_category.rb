# Adds a URL slug to FAQ categories
class AddUrlSlugToFaqCategory < ActiveRecord::Migration
  def change
    add_column :faq_categories, :urlslug, :string, null: false
  end
end
