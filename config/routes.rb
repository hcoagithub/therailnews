Rails.application.routes.draw do
 
  resources :notices do
    resources :comentarios, only: [:new, :create, :show, :edit, :destroy]
  end

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  delete '/notice/:id/comentarios/:id', to: 'comentarios#destroy', as: :delete_comentario
  delete '/products/:id', to: 'products#destroy'
  # Defines the root path route ("/")
  root "notices#index"
end
