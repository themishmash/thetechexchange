class PagesController < ApplicationController

  before_action :set_email, only: [:show]
 
  def index
   
  end 
  

  def home
    
  end 

  def show
  
  end 

### If a user who is not logged in tries to see a page they are not authorised to see, an error will come up
  def user
    if !user_signed_in? 
      redirect_to '/404.html'
    end
  end 

### If a user who is not an admin user tries to see a page they are not authorised to see, an error will come up. This method is related to cancancan
  def admin
    authorize! :admin, @listings
  end 

  private
  def set_user_listing
    id = params[:id]
    @listing = current_user.listings.find_by_id( id )

    if @listing == nil
      redirect_to listings_path
    
    end 
  end 

  def set_email #part of the before action. ONly should be called within this controller and no where else. so will make it private. 
    id = params[:listing_id]
    @listing = Listing.find(id)
  end 
  
end