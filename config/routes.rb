Rails.application.routes.draw do
  resources :articles
 get "up" => "rails/health#show", as: :rails_health_check
 root 'books#index'
 get 'books/new', to: 'books#new', as: 'new_book'
 post 'books', to: 'books#create', as: 'books'
 get 'books/:id', to: 'books#show', as: 'book'
 get 'books/:id/edit', to: 'books#edit', as: 'edit_book'
 patch 'books/:id', to: 'books#update'
 delete 'books/:id', to: 'books#destroy'
 get 'books', to: 'books#index'
end
