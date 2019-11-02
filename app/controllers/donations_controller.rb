class DonationsController < ApplicationController
load_and_authorize_resource
skip_authorize_resource :only => [:show, :new, :create]

  def index
    @donations = Donation.all
  end 

  def new
    @donation = Donation.new

  end 

  def show #line items for stripe. Line items is an array. 
     @donation = Donation.find(params[:id])

    session = Stripe::Checkout::Session.create(
      payment_method_types: [ 'card'],
      line_items: [{
        name: @donation.name,
        description: @donation.amount,
        amount: @donation.amount * 100, 
        currency: 'aud', 
        quantity: 1
      }],

    

      payment_intent_data: {
        metadata: {
          # user_id: current_user.id, 
          donation_id: @donation.id
        }
      },

      #where we want it to go when succeed. Root URL supplements your website and action want to take when success. 

      success_url: "#{root_url}payments/success?donationID=#{@donation.id}", 
      cancel_url: "#{root_url}donations"

)
  @session_id = session.id

# show only the name and money - no connection to stripe
# id = params[:id]
# @donation = Donation.find(id)


  end


  def create
    donation_params
    @donation = Donation.new(donation_params)
    
    if @donation.save
      redirect_to donation_path(@donation)
    end 
  end 

  def money
    if @donation.amount == nil
      @donation.amount = 1
    end 
  end 

private
  def set_donation
    id = params[:id]
    @donation = Donation.find(id)
  end 

  def donation_params
    params.permit(:name, :amount)
  end



end 