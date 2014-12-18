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
    resources :business
    resources :job_listings
    get '/' => "businesses#show"
  end

  # resources :businesses, path: '', param: :slug
  # resources :orders, only: [:index, :show, :create, :update]
  resources :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # namespace :businesses, as: :business, path: '/:slug' do
  #   resources :job_listing
  # end
  get '/contact' => 'home#contact'
  get '/about' => 'home#about'

  get '/admin' => 'admin#index'
  root 'home#index'

  get '/code' => redirect('https://github.com/chandracarney/dinner-dash')

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/cart' => 'cart#show'
  delete '/cart' => 'cart#destroy'
  post '/menu_items/:id/add_to_cart' => 'cart#update'


  get '/checkout' => 'orders#new'
  get '/my_orders' => 'orders#my_orders'

  scope module: :admin do
    resources :categories
    resources :menu_items
  end
end
