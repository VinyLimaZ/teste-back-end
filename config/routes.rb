Rails.application.routes.draw do
  resources :users, only: :create

  resources :accesses, only: :create
  get '/verify_uuid', to: 'accesses#verify_uuid'
  get '/access_report', to: 'accesses#index'
end
