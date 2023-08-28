Rails.application.routes.draw do
  root "flowcharts#index"
  devise_for :users
  resources :flowcharts, only: [:index, :new, :create, :show, :edit, :update] do
    resources :tasks, only: [:create]
  end
end
