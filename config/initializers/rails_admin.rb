RailsAdmin.config do |config|

  config.main_app_name = 'LSD'

  config.model 'CommitteeMember' do
    navigation_icon 'icon-user'
  end

  config.model 'Faq' do
    navigation_icon 'icon-question-sign'
  end

  config.model 'FaqCategory' do
    navigation_icon 'icon-list-alt'
  end

  config.model 'Package' do
    navigation_icon 'icon-tags'
  end

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
