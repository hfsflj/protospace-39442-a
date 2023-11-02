Rails.application.routes.draw do
    devise_for :users
    root to: 'prototypes#index'
  
    resources :users, :show
    resources :prototypes do
    resources :comments, only: :create
    

    end
  
    # r他のルートを追加する場合

  #post '/prototypes', to: 'prototypes#create'

  #resources :prototypes do
  #  get 'edit', on: :member 
  #  patch 'update', on: :member 
  #  delete 'destroy', on: :member
  #end


  # 他のルートを追加する場合
end
