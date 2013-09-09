SnapSplat::Application.routes.draw do
  resource :session, :only => [:create, :destroy, :new]
  resources :users, :only => [:create, :new, :show, :index] do
    resource :home, :only => [:show]
  end
  
  resources :photos
end
