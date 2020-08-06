Rails.application.routes.draw do
  get 'home/index'

  root 'home#index'

  get 'slack-connection', to: 'slack_connection#show'

  post 'contacts/:id', to: 'admin_reply#create'

  #Routes for slack reply messages
  post 'slack/reply', to: 'slack_command#reply'

  #routes for slack modals
  post 'slack/open-modal', to: 'slack_modal#handle_slack_interaction'

  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :contacts do
    resources :admin_reply
  end

end
