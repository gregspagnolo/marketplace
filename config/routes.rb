Rails.application.routes.draw do
  
  root 'pages#home'

  devise_for :users,
  			 :path => '',
  			 :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
  			 :controllers => {:omniauth_callbacks => 'omniauth_callbacks',
  			 :registrations => 'registrations'}

  resources :users, only: [:show]

  resources :services
  	resources :services do
  		resources :orders, only: [:create]
  	end

  resources :orders, only: [:show]
  resources :charges

  get '/user_orders' => 'orders#user_orders'
  get '/user_sales' => 'orders#user_sales'

end
