Rails.application.routes.draw do
  get "/search" => "searches#search"
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'
    get '/users/my_page' => 'users#my_page'
    get '/users/information/edit' => 'users#edit'
    patch '/users/information' => 'users#update'
    get '/users/unsubscribe' => 'users#unsubscribe'
    patch '/users/withdraw' => 'users#withdraw'
    get '/users/:id/bookmarks' => 'users#bookmarks'
    resources :users, only: [:index, :show] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :items, except: [:destroy] do
      resource :bookmarks, only: [:create, :destroy]
      resources :reviews
    end
    resources :genres, only: [:index, :create, :edit, :update]
    resources :makers, only: [:index, :create, :edit, :update]
  end
  namespace :admin do
    get 'homes/top'
  end
  #管理者
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  #ユーザー
  devise_for :user, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
