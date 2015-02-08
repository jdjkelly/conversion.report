class ChargesController < ApplicationController
  def new
  end
  
  def create
    # Amount in cents
    @amount = 500
    
    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card  => params[:stripeToken],
      :plan => 'crp'
    )
  
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
    
    current_user.update_attribute(:is_premium, true)
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
