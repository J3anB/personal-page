Rails.application.routes.draw do

  get 'home/index', as: :home

  root 'home#index'

  get 'slack-connection', to: 'slack_connection#show'

  #routes for weather refresh API button
  get 'weather/request', to: 'weather#weather_request', as: :weather_request

  #routes for weather chart
  get 'weather/chart_request', to: 'weather#weather_chart_request', as: :weather_chart

  #routes for cv card
  get 'cv_card/new', to: 'cv_cards#new'

  post 'cv_card/create', to: 'cv_cards#create'

  delete 'cv_cards/:id', to: 'cv_cards#destroy', as: :cv_card_destroy

  #routes for competence card

  get 'cv_competence/new', to: 'cv_competences#new'

  post 'cv_competence/create', to: 'cv_competences#create'

  delete 'cv_competence/:id', to: 'cv_competences#destroy', as: :cv_competence_destroy

  #routes for contact admin reply
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

  resources :cv_cards
  resources :cv_competences

end
