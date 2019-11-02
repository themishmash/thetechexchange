class PagesController < ApplicationController
  #load_and_authorize_resource
  before_action :set_email, only: [:show]
 
  def index
   
  end 
  

  def home
    
  end 

  def show
    #@listing = current_user.listings.find_by_id(params[:listing_id])
  end 

  #even if remove def not_found - it will find its way there (we tested this by removing the method). Rails magic??

  # def user
  #   user = @listing.user.email
  # end 

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