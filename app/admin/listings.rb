ActiveAdmin.register Listing do



  permit_params :title, :description, :system_id, :year_id, :condition_id, :location, :machine_id, :data_wiped, :is_donated, :picture


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :title, :description, :system_id, :year_id, :condition_id, :data_wiped, :is_donated, :machine_id, :location
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :title, :description, :system_id, :year_id, :condition_id, :data_wiped, :is_donated, :machine_id, :location]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
