Rails.application.routes.draw do
  # Routes for the Meeting resource:
  
  root "users#index"
  
  devise_for :users
  
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })
  post("/update_user/:id_to_update", { :controller => "users", :action => "participate"})
  
  
  # CREATE
  get("/meetings/new", { :controller => "meetings", :action => "new_form" })
  post("/create_meeting", { :controller => "meetings", :action => "create_row" })

  # READ
  get("/meetings", { :controller => "meetings", :action => "index" })
  get("/meetings/:id_to_display", { :controller => "meetings", :action => "show" })

  # UPDATE
  get("/meetings/:prefill_with_id/edit", { :controller => "meetings", :action => "edit_form" })
  post("/update_meeting/:id_to_modify", { :controller => "meetings", :action => "update_row" })

  # DELETE
  get("/delete_meeting/:id_to_remove", { :controller => "meetings", :action => "destroy_row" })

  #------------------------------


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
