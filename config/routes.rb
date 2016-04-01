Rails.application.routes.draw do

  %w( 403 404 422 500 ).each do |code|
    get code, to: 'errors#show', code: code
  end

  # This has to be the last route in your list
  match "*path", to: "errors#show", via: :all, code: 404 unless Rails.application.config.consider_all_requests_local

  mount Optimadmin::Engine => "/admin"
  root to: 'application#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
Optimadmin::Engine.routes.draw do
end