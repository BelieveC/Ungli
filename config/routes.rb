Rails.application.routes.draw do

    root "stories#index"

    get "/contact"=>"abouts#contact",as:"contact"
    match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
	match 'auth/failure', to: redirect('/'), via: [:get, :post]
	match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
	resources :users
    resources :stories
end
