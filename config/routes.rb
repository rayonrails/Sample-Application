SampleApp::Application.routes.draw do
  get "relationships/create"

  get "relationships/destroy"

  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resources :sessions, :only => [:new, :create, :destroy]
  resources :microposts, :only => [:create, :destroy]
  resources :relationships, :only => [:create, :destroy]
  
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/signup', :to => 'users#new'
  match '/contact', :to => 'pages#contact'
  match '/about', :to => 'pages#about'
  match '/help', :to => 'pages#help'
  
  get "pages/home"
  get "pages/contact"
  get "pages/about"
  get "pages/help"

  root :to => 'pages#home'
end
