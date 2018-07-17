Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    get "/articles" => "articles#index"
    get "/spotify_authorize" => "spotify#authorize"
    get "/spotify/callback" => "spotify#callback"
  end
end
