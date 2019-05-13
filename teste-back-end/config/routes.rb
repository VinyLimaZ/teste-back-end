Rails.application.routes.draw do
  resources :users, only: :create

  resources :accesses, only: %i[create index]
  get '/verify_uuid', to: 'accesses#verify_uuid'
end
