@sample_data = YAML.load_file("#{Rails.root}/config/sample-data.yml")

# Frequently asked questions
Faq.delete_all
FaqCategory.delete_all

@sample_data['faqs'].each do |faq_category, faqs|
  # Create the category
  category = FaqCategory.create name: faq_category

  # Add all of the FAQs
  faqs.each do |faq|
    new_faq = Faq.create faq

    category.faqs.push new_faq
  end
end

def create_items(model_class, yaml_name)
  model_class.delete_all

  @sample_data[yaml_name].each do |item|
    model_class.create item
  end
end

# Committee
create_items(CommitteeMember, 'committee')

# Packages
create_items(Package, 'packages')
