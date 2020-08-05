Rails.application.routes.draw do
  get 'home/index'

  root 'home#index'

  get 'slack-connection', to: 'slack_connection#show'

  post 'contacts/:id', to: 'admin_reply#create'


  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :contacts do
    resources :admin_reply
  end

end
