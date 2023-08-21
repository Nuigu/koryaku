Rails.application.routes.draw do
  root "flowcharts#index"
  resources :flowcharts, only: :index
end
