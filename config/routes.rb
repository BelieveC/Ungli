Rails.application.routes.draw do

    root "stories#index"

    get "/contact"=>"abouts#contact",as:"contact"

    resources :stories
end
