Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  resources :login

  resources :dashboard
  resources :colegios
  resources :estimadores
  resources :cursos

  root to:'dashboard#index'

  get '/logout' => 'login#logout'

end
