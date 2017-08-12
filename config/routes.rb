Rails.application.routes.draw do
  root to:'items#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'users/edit_address' => 'users/registrations#edit_address'
    put 'users/update_address' => 'users/registrations#update_address'
  end

  resources :items, only: [:index, :show]
  resources :stocked_items, only: [:index, :update, :destroy] do
    collection do
      get 'order_confirmation'
    end
  end
  resources :order_histories, only: [:index, :show, :create]

  namespace :admin do
    resources :items do
      put :sort
    end
    resources :users, only: [:index, :show, :edit, :update, :destroy]
  end
end
