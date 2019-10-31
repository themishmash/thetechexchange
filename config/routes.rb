Rails.application.routes.draw do

 
  devise_for :users
  get "/", to: "pages#home", as: "root"
  get "/:listing_id/email_donator", to: "pages#show", as: "email_donator"
  get "/help", to: "pages#help", as: "help"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/listings", to: "listings#index", as: "listings"
  post "/listings", to: "listings#create"
  get "/listings/new", to: "listings#new", as: "new_listing"
  get "/listings/:id", to: "listings#show", as: "listing" 
  put "/listings/:id", to: "listings#update"
  patch "/listings/:id", to: "listings#update"
  delete "/listings/:id", to: "listings#destroy"
  get "/listings/:id/edit", to: "listings#edit", as: "edit_listing"


  get "/machines", to: "machines#index", as: "machines"
  post "/machines", to: "machines#create"
  get "/machines/new", to: "machines#new", as: "new_machine"
  get "/machines/:id", to: "machines#show", as: "machine" 
  put "/machines/:id", to: "machines#update"
  patch "/machines/:id", to: "machines#update"
  delete "/machines/:id", to: "machines#destroy"
  get "/machines/:id/edit", to: "machines#edit", as: "edit_machine"

  get "/years", to: "years#index", as: "years"
  post "/years", to: "years#create"
  get "/years/new", to: "years#new", as: "new_year"
  get "/years/:id", to: "years#show", as: "year" 
  put "/years/:id", to: "years#update"
  patch "/years/:id", to: "years#update"
  delete "/years/:id", to: "years#destroy"
  get "/years/:id/edit", to: "years#edit", as: "edit_year"

  get "/systems", to: "systems#index", as: "systems"
  post "/systems", to: "systems#create"
  get "/systems/new", to: "systems#new", as: "new_system"
  get "/systems/:id", to: "systems#show", as: "system" 
  put "/systems/:id", to: "systems#update"
  patch "/systems/:id", to: "systems#update"
  delete "/systems/:id", to: "systems#destroy"
  get "/systems/:id/edit", to: "systems#edit", as: "edit_system"

  

  get "/donations/success", to: "donations#success"
  post "donations/webhook", to: "donations#webhook"

  get "*path", to: "pages#not_found", constraints: lambda { |req| req.path.exclude? 'rails/active_storage' } #can type any garbage and still go to page is not found. that * 
end
