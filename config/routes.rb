Rails.application.routes.draw do
  namespace :conveyancing_quotes do
    resources :equity_transfers, only: [:new, :create, :show]
    resources :sales, only: [:new, :create, :show]
    resources :sale_and_purchases, only: [:new, :create, :show]
    resources :purchases, only: [:new, :create, :show]
    resources :remortgages, only: [:new, :create, :show]
    resources :remortgage_with_equity_transfers, only: [:new, :create, :show]
  end
  resources :team_members, only: [:index, :show], path: 'team-members' do
    member do
      get 'testimonials'
    end
    collection do
      get 'search'
    end
  end

  resources :article_categories, only: :show, path: 'article-categories'
  resources :office_locations, only: :show, path: 'office-locations'
  resources :resource_categories, only: :show, path: 'resource-categories'
  resources :video_categories, only: :show, path: 'video-categories'
  resources :event_categories, only: :show, path: 'event-categories'
  resources :event_locations, only: :show, path: 'event-locations'

  resources :case_studies, only: [:index, :show], path: 'case-studies'
  resources :articles, only: [:index, :show]
  resources :offices, only: [:index, :show]
  resources :resources, only: [:index, :show]
  resources :videos, only: [:index, :show]
  resources :events, only: [:index, :show]
  resources :pages, only: :show
  resources :contacts, only: [:new, :create], path: 'contact-us'
  resources :callback_requests, only: [:new, :create], path: 'callback-request'

  resources :audiences, only: :show do
    resources :services, only: :show do
      resources :service_pages, only: :show, path: 'pages', controller: 'services/pages'
    end
  end

  %w( 403 404 422 500 ).each do |code|
    get code, to: 'errors#show', code: code
  end

  mount Optimadmin::Engine => '/admin'

  root to: 'homes#show'

  # This has to be the last route in your list
  match '*path', to: 'errors#show', via: :all, code: 404 unless Rails.application.config.consider_all_requests_local

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
Optimadmin::Engine.routes.draw do
end
