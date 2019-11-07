class DonationsController < ApplicationController

#### Visitors to this site can make a donation without signing up or logging in, which is why they can read and create.
### Admin has crud access to this site using cancancan gem

load_and_authorize_resource
skip_authorize_resource :only => [:show, :new, :create]


  def home
  end 

  def index
    @donations = Donation.all
  end 

  def new
    @donation = Donation.new

  end 


#### This is connecting to a Stripe session using stripe's API 

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

      #This is where we want it to go when it succeeds. Root URL supplements your website and action want to take when success. 
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
      redirect_to @donation
    else 
      render :new
    end 
  end 


  def update
    if @donation.update (donation_params)
      redirect_to @donation
    end 
  end 

  def destroy
    @donation.destroy
    redirect_to root_path
  end 

private
  def set_donation
    id = params[:id]
    @donation = Donation.find(id)
  end 

  def donation_params
    params.require(:donation).permit(:name, :amount)
  end

end 