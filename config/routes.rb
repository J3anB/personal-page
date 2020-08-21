Rails.application.routes.draw do
  get 'home/index', as: :home

  root 'home#index'

  get 'slack-connection', to: 'slack_connection#show'

  #routes for weather refresh API button
  get 'weather/request', to: 'weather#weather_request', as: :weather_request

  #routes for weather chart
  get 'weather/chart_request', to: 'weather#weather_chart_request', as: :weather_chart


  post 'contacts/:id', to: 'admin_reply#create'

  #Routes to destroy contact
  delete 'contacts/:id', to: 'contacts#destroy', as: :contact_destroy

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
