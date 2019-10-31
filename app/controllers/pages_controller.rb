class PagesController < ApplicationController
  before_action :set_email, only: [:show]

  def home
     
  end

  def help
    # session = Stripe::Checkout::Session.create(
    #     payment_method_types: [ 'card'],
    #     customer_email: current_user.email, #set up by devise
    #     line_items: [{
          
          
    #       currency: 'aud', 
    #       quantity: 1
    #     }],

    #     payment_intent_data: {
    #       metadata: {
    #         user_id: current_user.id, 
            
    #       }
    #     },

    #     #where we want it to go when succeed. Root URL supplments your website and action want to take when success. 

    #     success_url: "#{root_url}payments/success?userID=#{current_user.id}", 
    #     cancel_url: "#{root_url}listings"
    # )

    # @session_id = session.id

  end 

  def show
    # @listing = current_user.listings.find_by_id(params[:listing_id])
  end 

  #even if remove def not_found - it will find its way there (we tested this by removing the method). Rails magic??

  # def user
  #   user = @listing.user.email
  # end 

  private

  def set_email #part of the before action. ONly should be called within this controller and no where else. so will make it private. 
    id = params[:listing_id]
    @listing = Listing.find(id)
  end 
  
end