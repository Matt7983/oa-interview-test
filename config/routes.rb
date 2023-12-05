Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :teachers do
    member do
      post 'follow_student', to: 'teachers#follow_student'
      delete 'unfollow_student', to: 'teachers#unfollow_student'
      get 'followed_students', to: 'teachers#followed_students'
    end
  end
end
