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
    namespace :business do
      resources :job_listings
    end

    resources :job_listings

    get '/' => 'job_listings#show'
  end




  # resources :business, path: '', param: :slug
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # namespace :businesses, as: :business, path: '/:slug' do
  #   resources :job_listing
  # end


  root 'home#index'

  get '/menu' => 'home#menu'
  get '/menu/:id' => 'home#yum'
  get '/contact' => 'home#contact'
  get '/about' => 'home#about'

  get '/admin' => 'admin#index'

  get '/code' => redirect('https://github.com/chandracarney/dinner-dash')

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/cart' => 'cart#show'
  delete '/cart' => 'cart#destroy'
  post '/menu_items/:id/add_to_cart' => 'cart#update'

  resources :orders, only: [:index, :show, :create, :update]
  get '/checkout' => 'orders#new'
  get '/my_orders' => 'orders#my_orders'

  resources :users
  scope module: :admin do
    resources :categories
    resources :menu_items
  end
end


