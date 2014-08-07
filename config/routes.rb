Rails.application.routes.draw do
  root "task_lists#index"
  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy", as: :signout
  get "about" => "about#about"

  get "task_lists/new" => "task_lists#new"
  post "task_lists/create" => "task_lists#create"
  get '/task_lists/:id/completed' => 'task_lists#completed'
  get '/task_lists/assigned_tasks' => 'task_lists#assigned'

  get "tasks/:id/new" => "tasks#new"
  get '/tasks/:id/complete' => 'tasks#complete'

  resources :task_lists
  resources :tasks
end
