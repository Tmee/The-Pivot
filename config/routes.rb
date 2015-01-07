  class Subdomain
  def self.matches?(request)
    request.subdomain.present? && request.subdomain != "www" && request.subdomain != ""
  end
end

# class RootDomain
#   @subdomains = ["www"]

#   def self.matches?(request)
#     @subdomains.include?(request.subdomain) || request.subdomain.blank?
#   end
# end

Rails.application.routes.draw do

  # business-name.lvh.me
  constraints(Subdomain) do
    resources :business, only: [:show]
    resources :listings
    get '/'     => "businesses#show"
    get '/admin' => 'businesses#admin'
    get '/admin/edit' => 'businesses#edit'
    post '/:email' => 'users#update_business_owner'
  end

  root 'home#index'
  # resources :businesses, path: '', param: :slug
  # resources :orders, only: [:index, :show, :create, :update]
  resources :users
  resources :listings
  resources :businesses, only: [:index, :new, :create]
  resources :candidacies

  # You can have the root of your site routed with "root"
  # namespace :businesses, as: :business, path: '/:slug' do
  #   resources :job_listing
  # end
  get '/contact' => 'home#contact'
  get '/about' => 'home#about'


  get '/code' => redirect('https://github.com/Tmee/The-Pivot')

  get '/login' => 'sessions#new',  :as => :login
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/cart' => 'cart#show'
  delete '/cart' => 'cart#destroy'
  post '/listings/:id/add_to_cart' => 'cart#update', :as => :add_listing


  get '/checkout' => 'orders#new'
  get '/my_orders' => 'orders#my_orders'

  # get 'files/:id' => 'posts#destroy_file', :via => :delete, :as => :destroy_file
  get '/admin', to: 'admin/base_admin#index', as: :admin_index
  namespace :admin do
    resources :businesses, :users, :listings
  end
end
