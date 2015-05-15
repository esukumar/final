Rails.application.routes.draw do

  root 'home#index', :as => 'home'

  resources :events do
    concern :commentable do
      resources :comments, only:[:create,:destroy]
    end
    resources :notes, except:[:index,:show], concerns: :commentable
    resources :images, except:[:index,:show], concerns: :commentable
    resources :activities, except:[:index], shallow: true
  end

  resources :activities, only:[:index]
  resources :event_activities, only: [:destroy]

end
