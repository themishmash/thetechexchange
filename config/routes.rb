Rails.application.routes.draw do

  devise_for :users
  get "/", to: "pages#home", as: "root"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "*path", to: "pages#not_found", constraints: lambda { |req| req.path.exclude? 'rails/active_storage' } #can type any garbage and still go to page is not found. that * 
end
