SnapSplat::Application.routes.draw do
  root to: 'sessions#new'
  
  resource :session, :only => [:create, :destroy, :new]
  resources :users, :only => [:create, :new, :show, :index] do
    resource :home, :only => [:show]
    resources :photos
    resources :follows, :only => [:create, :destroy]
  end
  
end
