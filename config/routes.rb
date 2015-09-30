Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'application#index'

  get 'about-the-club' => 'application#about', as: :about

  get 'events' => 'events#index', as: :events

  get 'prices' => 'packages#index', as: :packages

  get 'faqs' => 'faqs#index', as: :faq
  get 'faqs/:urlslug' => 'faqs#show', as: :faq_category

  get 'committee' => 'members#index', as: :members

  get 'contact' => 'application#contact'
end
