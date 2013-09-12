SnapSplat::Application.routes.draw do
  root to: 'sessions#new'
  
  resource :session, :only => [:create, :destroy, :new]
  resources :users, :except => [:destroy] do
    resource :home, :only => [:show]
    resources :photos, :only => [:new, :create, :show, :index]
    resources :follows, :only => [:create, :destroy]
  end
  
end
