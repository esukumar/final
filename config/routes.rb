Rails.application.routes.draw do
  root 'home#index', :as => 'home'

  resources :events do
    concern :commentable do
      resources :comments, only:[:create,:destroy]
    end
    resources :notes, except:[:index,:show], concerns: :commentable
  end

end
