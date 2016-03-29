Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
    
  get 'login' => 'login#index'
  post 'login' => 'login#do_login'
  get 'logout' => 'login#logout'

  resources :rsvps, only: [:create, :index]

  get '/' => 'home#index'
  get '/thankyou' => 'rsvps#thankyou'
  get '/error' => 'rsvps#error'

end
