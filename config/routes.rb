Rails.application.routes.draw do

  root 'home#index'

  ##### Sign Up and Sign In and Sign Out
  resources :users, only:[:show,:new,:create,:destroy]
  resources :sessions, only:[:new,:create,:destroy]

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
