Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'songs#index'

  get 'songs', to: 'songs#index'
  get 'songs/new', to: 'songs#new'
  post 'songs/create', to: 'songs#create'
  get 'songs/edit/:id', to: 'songs#edit', as: :songs_edit_path
  patch 'songs/edit/:id', to: 'songs#save_edit'
  delete 'songs/delete/:id', to: 'songs#delete', as: :songs_delete_path
end
