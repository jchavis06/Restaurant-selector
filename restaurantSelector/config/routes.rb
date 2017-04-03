Rails.application.routes.draw do
  get '/', to: 'home#question1'
  get '/home', to: 'home#question1'
  get 'home/question1', to: 'home#question1'
  get 'home/question2', to: 'home#question2'
  get 'home/question3', to: 'home#question3'
  get 'home/question4', to: 'home#question4'
  get 'home/question5', to: 'home#question5'
  get 'home/question6', to: 'home#question6'
  get 'home/submit', to: 'home#submit'

  post '/home', to: 'home#question2'
  post '/home/question1', to: 'home#question2'
  post '/home/question2', to: 'home#question3'
  post '/home/question3', to: 'home#question4'
  post '/home/question4', to: 'home#question5'
  post '/home/question5', to: 'home#question6'
  post '/home/question6', to: 'home#submit'
  post '/home/submit', to: 'home#submit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
