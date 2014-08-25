# Creates the table used to store FAQs
class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.string :question
      t.text :answer
      t.integer :weighting
      t.belongs_to :faq_category

      t.timestamps
    end
  end
end
