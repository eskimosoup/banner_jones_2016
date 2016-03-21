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

  resources :downloads, only: [:index, :show]
  resources :download_categories, only: :show

  resources :audiences, only: :show do
    resources :departments, only: :show do
      resources :services, only: :show
    end
  end

  %w( 403 404 422 500 ).each do |code|
    get code, to: 'errors#show', code: code
  end

  mount Optimadmin::Engine => '/admin'

  root to: 'application#index'

  # This has to be the last route in your list
  match '*path', to: 'errors#show', via: :all, code: 404 unless Rails.application.config.consider_all_requests_local
end
Optimadmin::Engine.routes.draw do
  get 'services/index'

  get 'services/show'

  resources :pages, except: :show do
    collection do
      post 'order'
    end
    member do
      get 'edit_images'
      get 'toggle'
      get 'edit_images'
      post 'update_image_default'
      post 'update_image_fill'
      post 'update_image_fit'
    end
  end
  resources :blog_posts, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
      get 'edit_images'
      post 'update_image_default'
      post 'update_image_fill'
      post 'update_image_fit'
    end
  end
  resources :blog_categories, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :banners, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :frequently_asked_questions, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :event_locations, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :events, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
      get 'edit_images'
      post 'update_image_default'
      post 'update_image_fill'
      post 'update_image_fit'
    end
  end
  resources :event_categories, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :awards, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
      get 'edit_images'
      post 'update_image_default'
      post 'update_image_fill'
      post 'update_image_fit'
    end
  end
  resources :services, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
      get 'edit_images'
      post 'update_image_default'
      post 'update_image_fill'
      post 'update_image_fit'
    end

    resources :service_related_services, only: :index do
      collection do
        post 'order'
      end
      member do
        get 'toggle'
      end
    end
  end
  resources :audiences, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :departments, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
      get 'edit_images'
      post 'update_image_default'
      post 'update_image_fill'
      post 'update_image_fit'
    end
  end

  resources :downloads, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
      get 'edit_images'
      post 'update_image_default'
      post 'update_image_fill'
      post 'update_image_fit'
    end
  end
  resources :download_categories, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :article_categories, except: [:show] do
    collection do
      resources :published, as: 'article_categories_published', to: 'article_categories/published'
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :offices, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
      get 'edit_images'
      post 'update_image_default'
      post 'update_image_fill'
      post 'update_image_fit'
    end
  end
  resources :office_locations, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  resources :team_member_roles, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
    end
  end
  mount Flip::Engine => '/flip' if Rails.env.development?

  resources :articles, except: [:show] do
    member do
      get 'toggle'
      get 'edit_images'
      post 'update_image_default'
      post 'update_image_fill'
      post 'update_image_fit'
    end
  end
  resources :testimonials, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
      get 'edit_images'
      post 'update_image_default'
      post 'update_image_fill'
      post 'update_image_fit'
    end
  end
  resources :team_members, except: [:show] do
    collection do
      post 'order'
    end
    member do
      get 'toggle'
      get 'edit_images'
      post 'update_image_default'
      post 'update_image_fill'
      post 'update_image_fit'
    end

    resources :team_member_additional_roles, only: :index do
      collection do
        post 'order'
      end
      member do
        get 'toggle'
      end
    end
  end
end
