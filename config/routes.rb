Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  namespace :v1, defaults: { format: :json } do

    resources :movies do 
      resources :actors
      resources :genres
    end
    resources :actors do 
      resources :movies
    end

    resources :genres do 
      resources :movies
    end

  end


  namespace :v2, defaults: { format: :json } do

    resources :movies do 
      resources :actors
      resources :genres
    end
    
    resources :actors do 
      resources :movies
    end

    resources :genres do 
      resources :movies
    end

  end
end
