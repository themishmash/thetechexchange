class PaymentsController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [ :webhook ] #skip authenticity as using webhook. otherwise screws things up due to external thing coming through. 


  #If payment is successful to stripe, user is redirected to the success page

  def success
   @donation = Donation.find(params[:donationID])
   @name = Donation.name
  end 

  def webhook
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve( payment_id )
    donation_id = payment.metadata.listing_id
    p "listing id =" + listing_id
    p "user id =" + user_id
    status 200
  end 

  private

end 