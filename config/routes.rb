Rails.application.routes.draw do
  resources :team_members, only: [:index, :show] do
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

  resources :articles, only: [:index, :show]
  resources :offices, only: [:index, :show]
  resources :resources, only: [:index, :show]
  resources :videos, only: [:index, :show]
  resources :events, only: [:index, :show]
  resources :pages, only: :show

  resources :audiences, only: :show do
    resources :services, only: :show do
      resources :service_pages, only: :show, path: 'pages'
    end
  end

  %w( 403 404 422 500 ).each do |code|
    get code, to: 'errors#show', code: code
  end

  mount Optimadmin::Engine => '/admin'

  root to: 'application#index'

  # This has to be the last route in your list
  match '*path', to: 'errors#show', via: :all, code: 404 unless Rails.application.config.consider_all_requests_local

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
Optimadmin::Engine.routes.draw do
  get 'services/show'

  namespace :audiences do
    get 'services/show'
  end
end
