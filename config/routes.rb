Rails.application.routes.draw do
  resources :users, only: :create

  resources :accesses, only: :create
  get '/verify_uuid', to: 'accesses#verify_uuid'
  get '/access_report', to: 'accesses#index'


  root to: static('index.html')
  get '/index', to: static('index.html'), as: :site_index
  get '/contact', to: static('contact.html'), as: :site_contact
  get '/about', to: static('about.html'), as: :site_about
  get '/access_report', to: static('access_report.html'), as: :site_access_report
end
