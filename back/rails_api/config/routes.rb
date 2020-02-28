Rails.application.routes.draw do
  get 'questions', to: 'questions#index'
  post 'answers', to: 'answers#answers' 
end
