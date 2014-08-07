Rails.application.routes.draw do

  # mount Split::Dashboard, :at => 'split'

  devise_for :users

  resources :projects, only: [:index, :new, :create, :edit, :update] do
    resources :discussions, only: [:new, :create, :show, :index] do
      resources :comments, only: [:create, :edit, :update]
    end
    resources :tasks, only: [:index, :new, :create, :edit, :update, :show, :destroy] do
      resources :comments, only: [:create, :edit, :update]
      resources :completions, only: [:create]
      resources :tagings, only: [:create]
      resources :todos, only: [:create] do
        resources :completions, only: [:create]
      end
    end
  end

  root 'projects#index'

end
