Rails.application.routes.draw do
  resources :pages, only: :show

  resources :team_members, only: [:index, :show] do
    collection do
      get 'search'
    end
  end

  resources :article_categories, only: :show
  resources :articles, only: [:index, :show]

  resources :office_locations, only: :show
  resources :offices, only: [:index, :show]

  resources :resources, only: [:index, :show]
  resources :download_categories, only: :show

  resources :departments, only: :show do
    resources :services, only: :show
  end

  %w( 403 404 422 500 ).each do |code|
    get code, to: 'errors#show', code: code
  end

  # This has to be the last route in your list
  match '*path', to: 'errors#show', via: :all, code: 404 unless Rails.application.config.consider_all_requests_local

  mount Optimadmin::Engine => '/admin'
  root to: 'application#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
Optimadmin::Engine.routes.draw do
end
