FayeChat::Application.routes.draw do

  get "chats/room"

  get "home/index"

  get "sessions/new"
  get "users/new"
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  get "/chatroom" => "chats#room", :as => :chat
  post '/new_message' => 'chats#new_message', :as => :new_message
  
  resources :users
  resources :sessions 
  resources :users
  resources :sessions

	root :to => "home#index"

end
