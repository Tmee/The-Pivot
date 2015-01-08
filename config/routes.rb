class Subdomain
  def self.matches?(request)
    request.subdomain.present? && request.subdomain != "www" && request.subdomain != ""
  end
end

Rails.application.routes.draw do

  constraints(Subdomain) do
    resources :business, only: [:show]
    resources :listings
    get '/'     => "businesses#show"
    get '/admin' => 'businesses#admin'
    get '/admin/listings/:id/candidacies' => 'candidacies#index'

    get '/admin/candidacies/:id/accept' => 'candidacies#accept', as: :accept_candidacy
    get '/admin/candidacies/:id/reject' => 'candidacies#reject', as: :reject_candidacy
    get '/admin/edit' => 'businesses#edit'
    post '/:email' => 'users#update_business_owner'
  end

  root 'home#index'

  resources :users
  resources :listings
  resources :businesses, only: [:index, :new, :create] do
    resources :listings, :candidacies
  end

  resources :candidacies, only: [:new, :create]

  get '/code' => redirect('https://github.com/Tmee/The-Pivot')

  get '/login' => 'sessions#new',  :as => :login
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/cart' => 'cart#show'
  delete '/cart' => 'cart#destroy'
  post '/listings/:id/add_to_cart' => 'cart#update', :as => :add_listing

  get '/admin', to: 'admin/base_admin#index', as: :admin_index
  namespace :admin do
    resources :businesses, :users, :listings
  end
end
