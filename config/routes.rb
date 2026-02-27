Rails.application.routes.draw do
  get "topics/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # topicesにアクセスしたらindexを表示する
  resources :topics, only: [:index]

  root "topics#index"
end
