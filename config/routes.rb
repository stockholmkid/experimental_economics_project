Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  devise_for :users, controllers: { registrations: "registrations" }
  as :user do
    get '/' => 'devise/registrations#new'
  end
  resources :rounds, param: :id
end
