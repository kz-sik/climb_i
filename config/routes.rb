Rails.application.routes.draw do
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'bookmarks/index'
    get 'bookmarks/create'
    get 'bookmarks/destroy'
  end
  namespace :public do
    get 'reviews/index'
    get 'reviews/new'
    get 'reviews/create'
    get 'reviews/show'
    get 'reviews/edit'
    get 'reviews/update'
    get 'reviews/destroy'
  end
  namespace :public do
    get 'makers/index'
    get 'makers/create'
    get 'makers/edit'
    get 'makers/update'
  end
  namespace :public do
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/update'
    get 'users/unsubscribe'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
    get 'items/new'
    get 'items/create'
    get 'items/edit'
    get 'items/update'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  #管理者
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  #ユーザー
  devise_for :user,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
