Deccanrubyconf::Application.routes.draw do

  devise_for :users, :controllers => {:registrations => 'registrations'}

  # Authentication
  devise_scope :user do
    get '/login' => 'devise/sessions#new', as: :login
    get '/logout' => 'devise/sessions#destroy', :as => :logout
    get '/signup' => 'registrations#new', :as => :signup
    scope 'my' do
      get 'profile', to: 'registrations#edit'
      put 'profile/update', to: 'registrations#update'
      get 'password/edit', to: 'registrations#edit_password'
      put 'password/update', to: 'registrations#update_password'
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  unauthenticated do
    get '/logout' => redirect("/")
  end

  authenticate :user, ->(u) { u.super_admin? } do
    get "/delayed_job" => DelayedJobWeb, :anchor => false
    put "/delayed_job" => DelayedJobWeb, :anchor => false
    post "/delayed_job" => DelayedJobWeb, :anchor => false
  end

  ActiveAdmin.routes(self)

  get "/pages" => "pages#index", as: :pages
  get "pages/contact_us"
  get "pages/about"


  namespace :superadmin do
    root to: 'users#index'
    resources :users

    resources :email_logs
  end

  root 'home#landing'
end
