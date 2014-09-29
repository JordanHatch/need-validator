Rails.application.routes.draw do

  resources :needs do
    collection do
      match :next, via: [:get, :post]
      get :results
    end

    member do
      post :review
    end
  end

  root to: redirect('/needs')

end
