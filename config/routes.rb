Rails.application.routes.draw do

  get '/laporan_keluar' => 'laporan_keluar#index'

  get 'dashboard/index'

  devise_for :users

  authenticated :user do
    root to: 'dashboard#index', as: :authenticated_root
  end

  root to: redirect('/users/sign_in')

  resources :uang_masuks
  resources :uang_keluars

  get '/laporan_masuk' => 'laporan_masuk#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
