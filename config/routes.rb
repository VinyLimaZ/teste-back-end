Rails.application.routes.draw do
  resources :users, only: :create

  resources :accesses, only: :create
  get '/verify_uuid', to: 'accesses#verify_uuid'
  get '/access_report', to: 'accesses#index'


  root to: static('access_report.html')
  get '/access_report', to: static('access_report.html'), as: :site_access_report
end
