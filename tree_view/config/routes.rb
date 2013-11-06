TreeView::Application.routes.draw do
  root :to => 'apparels#index'

  resources :apparels
end