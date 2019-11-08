class ListingsController < ApplicationController

### Users can see the index of the listings, but need to sign up or login if they wish to see the 'show' page.
### Admin has CRUD access using cancancan gem. 

  load_and_authorize_resource
  skip_authorize_resource :only => :show 
  before_action :authenticate_user!, only: [:show]
  before_action :set_listing, only: [:show] 
  #before_action :set_user_listing, only: [ :edit, :update, :destroy ]
  
  
  def index 
  ### This is using the ransack and kaminari gems so users can search the listings and the listings are arranged appropriately on each page.
    @q = Listing.ransack(params[:q])
    @listings = @q.result.includes(:machine, :system, :condition, :year)
    @listings = @listings.order('created_at DESC').page(params[:page]).per(12)
  end

  
#This creates the object instance @listing
  def new
    @listing = Listing.new
  end

  def show
    id = params[:id]
    @listing = Listing.find(id)

    if @listing == nil
      redirect_to root_path
    end 
  end

# This will create a new listing and then save it to the database provided it satisfies the parameters 
  def create
    listing_params = params.require(:listing).permit(:title, :description, :system_id, :year_id, :condition_id, :location, :machine_id, :data_wiped, :is_donated, :picture) 
    
    @listing = current_user.listings.new( listing_params )
  
    if @listing.save && @listing.data_wiped == true
      @listing.is_donated = 'published'
      @listing.save
    else 
      @listing.is_donated = 'pending'
      @listing.save
    end 

    if @listing.save 
    
    redirect_to @listing 
    else 
      render :new 
    end 
     
  end

# This updates the listing and then saves it to the database
  def update
    if @listing.update( listing_params ) && @listing.data_wiped == true
      @listing.is_donated = 'published'
      @listing.save    
    else @listing.update( listing_params ) && @listing.data_wiped == false || @listing.update( listing_params ) && @listing.data_wiped == nil
      @listing.is_donated = 'pending'
      @listing.save   
    end 
    
    if @listing.update( listing_params )
      redirect_to @listing
    else 
      render :edit
    end 
  end

#This provides the method for deleting from the database
  def destroy
    @listing.destroy
    redirect_to root_path
  end


  private

  
  def set_listing 
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