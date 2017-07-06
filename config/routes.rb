Rails.application.routes.draw do
  root to: 'static_pages#root'
  get '/favorites' => 'static_pages#favorites'
  post :search, controller: 'static_pages'
end
