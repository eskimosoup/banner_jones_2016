# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sitemap', to: 'application#sitemap'

  namespace :conveyancing_quotes, path: 'conveyancing-quotes' do
    concern :downloadable do
      resource :download, only: [:show]
    end

    resource :sales,
             only: :update

    resource :purchases,
             only: :update

    resource :sale_and_purchases,
             only: :create,
             path: 'sale-and-purchase'

    # resource :deeds,
    #         only: %i[new edit update]

    # resource :property_addresses,
    #         only: %i[new create edit update],
    #         path: 'property-address'

    # resource :correspondence_addresses,
    #         only: %i[new create edit update],
    #         path: 'correspondence-address'

    resources :quote_locations,
              only: :show,
              path: '',
              shallow: true,
              as: :location do
      resource :users,
               only: %i[new create edit update show],
               path: 'request',
               concerns: :downloadable do
        get 'thank-you', on: :collection
      end
    end
  end

  resources :frequently_asked_questions, only: [:index], path: 'frequently-asked-questions'
  resources :payments, only: %i[new create show]
  match '/payments/gateway_reply', to: 'payment_gateway_replies#create', via: %i[get post]
  resources :testimonials, only: [:index]

  resources :team_members, only: %i[index show], path: 'team-members' do
    member do
      get 'testimonials'
    end
    collection do
      get 'search'
      resources :audiences, path: 'services', only: [] do
        resources :services, only: :show, path: '', controller: 'team_members/services', as: 'team_member_services'
      end
    end
  end

  resources :article_categories, only: :show, path: 'article-categories'
  resources :office_locations, only: :show, path: 'office-locations'
  resources :resource_categories, only: :show, path: 'resource-categories'
  # resources :video_categories, only: :show, path: 'video-categories'
  resources :event_categories, only: :show, path: 'event-categories'
  resources :event_locations, only: :show, path: 'event-locations'

  # resources :case_studies, only: %i[index show], path: 'case-studies'
  resources :articles, only: %i[index show]
  resources :offices, only: %i[index show]
  resources :resources, only: %i[index show]
  # resources :videos, only: [:index, :show]
  resources :events, only: %i[index show]
  resources :pages, only: :show
  # FIXME: This is used in conjuction with the engine, so you end up with
  # /contacts/new and /contact-us/new - it should be one or the other.
  resources :contacts, only: %i[new create] # Here for legacy
  resources :contacts, only: %i[new create], path: 'contact-us' do
    post 'inpage-contact', on: :collection, as: :inpage, to: 'contacts#inpage'
  end
  resources :callback_requests, only: %i[new create], path: 'callback-request'

  %w[403 404 422 500].each do |code|
    get code, to: 'errors#show', code: code
  end

  mount Optimadmin::Engine => '/admin'

  root to: 'homes#show'

  get '/:audience_id/services/:parent_service_id/:service_id/:service_nested_id/testimonials',
      to: 'services#testimonials',
      as: :audience_child_service_testimonials

  get '/:audience_id/services/:parent_service_id/:service_id/:service_nested_id/frequently-asked-questions',
      to: 'services#frequently_asked_questions',
      as: :audience_child_service_frequently_asked_questions

  resources :audiences, only: :show, path: '' do
    resources :services, only: :show do
      get 'testimonials'
      get 'frequently-asked-questions'

      resources :service_pages,
                only: :show,
                path: 'pages',
                controller: 'services/pages'

      resources :services, only: :show, path: '', param: :nested_id do
        get 'testimonials'
        get 'frequently-asked-questions'

        resources :service_pages,
                  only: :show,
                  path: 'pages',
                  controller: 'services/pages'
      end
    end
  end

  resources :searches, only: :new

  get '/:audience_id/services/:parent_service_id/:service_id/:id',
      to: 'services#show',
      as: :audience_child_service

  get '/:audience_id/services/:grandparent_service_id/:parent_service_id/:service_id/pages/:id',
      to: 'services/pages#show',
      as: :audience_child_service_page

  # This has to be the last route in your list
  match '*path', to: 'errors#show', via: :all, code: 404 unless Rails.application.config.consider_all_requests_local

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
Optimadmin::Engine.routes.draw do
  concern :imageable do
    member do
      get 'edit_images'
      post 'update_image_default'
      post 'update_image_fill'
      post 'update_image_fit'
    end
  end

  concern :orderable do
    collection do
      post 'order'
    end
  end

  concern :toggleable do
    member do
      get 'toggle'
    end
  end

  concern :publishable do |options|
    collection do
      resources :expired,
                as: "expired_#{options[:module]}",
                controller: "#{options[:module]}/expired"
      resources :scheduled,
                as: "scheduled_#{options[:module]}",
                controller: "#{options[:module]}/scheduled"
      resources :published,
                as: "published_#{options[:module]}",
                controller: "#{options[:module]}/published"
    end
  end

  # Module routes go below concerns
  namespace :conveyancing_quotes do
    resources :quote_locations do
      resources :users, only: %i[index show]
    end
  end
end
