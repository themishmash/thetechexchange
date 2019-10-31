class ListingsController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => :show 
  before_action :authenticate_user!, only: [:show]
  before_action :set_listing, only: [:show] 
  #before_action :set_user_listing, only: [ :edit, :update, :destroy ]
  
  
  def index 
    @listings = Listing.all #dealing with many
    #@listings = current_user.listings
  end

  def new
    @listing = Listing.new
    #@listing.date_of_birth = "1971-01-01" #this will set default dob in view of new listing. 
    
  end

  def show


    id = params[:id]
    #@listing = current_user.listings.find_by_id(id)
    @listing = Listing.find(id)

    if @listing == nil
      redirect_to root_path
    end 

    

    

  end

  def create
    
    listing_params = params.require(:listing).permit(:title, :description, :system_id, :year_id, :condition_id, :location, :machine_id, :data_wiped, :is_donated, :picture) #this added so now after create new snake. look at schema to help make this. listing params - assigned to instance variable below.
    # @listing = Listing.new( listing_params ) 
    
    @listing = current_user.listings.new( listing_params )

    # @listing.traits << Trait.find(params[:listing][:trait_id])
  

    if @listing.save 
    #this saves to database. Data that is sent to controller - passed to instance variable and then saved. 
  
    redirect_to @listing #this creates another error. need new params to set instance variable. see above now listing_params = blah blah blah
    else 
      render :new #has to be symbol new. 
    end 
      #finish logic for creating a record
  end


  def edit
  end 

  def update
    # listing_params = params.require(:listing).permit(:title, :description, :system_id, :year_id, :condition_id, :location, :machine_id, :data_wiped, :is_donated, :picture)
    if @listing.update( listing_params )
      
      redirect_to @listing
    else 
      render :edit
    end 
      
  end

  def destroy

    @listing.destroy
    redirect_to root_path

  end


  private

  def set_listing #part of the before action. ONly should be called within this controller and no where else. so will make it private. 
    id = params[:id]
    @listing = Listing.find(id)
  end 

  def listing_params
    params.require(:listing).permit(:title, :description, :system_id, :year_id, :condition_id, :location, :machine_id, :data_wiped, :is_donated, :picture)
  end 

  def set_user_listing
    id = params[:id]
    @listing = current_user.listings.find_by_id( id )

    if @listing == nil
      redirect_to listings_path
    
    end 
  end 

end 