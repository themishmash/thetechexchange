class PagesController < ApplicationController
  #load_and_authorize_resource

 

  

  def home
    
  end 

  def show
    # @listing = current_user.listings.find_by_id(params[:listing_id])
  end 

  #even if remove def not_found - it will find its way there (we tested this by removing the method). Rails magic??

  # def user
  #   user = @listing.user.email
  # end 

  
  
end