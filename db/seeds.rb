sample_data = YAML::load_file("#{Rails.root}/config/sample-data.yml")

# Frequently asked questions
Faq.delete_all
FaqCategory.delete_all

sample_data['faqs'].each do |faq_category, faqs|
  # Create the category
  category = FaqCategory.create name: faq_category

  # Add all of the FAQs
  faqs.each do |faq|
    new_faq = Faq.create faq

    category.faqs.push new_faq
  end
end

# Committee
CommitteeMember.delete_all

sample_data['committee'].each do |committee_member|
  CommitteeMember.create committee_member
end