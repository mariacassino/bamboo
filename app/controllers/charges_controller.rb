class ChargesController < ApplicationController

  def new
  end

  def create
    @item = Item.find params[:item_id]
    @amount = @item.stripe_amount.to_i #This is $5
    customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
    )
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path

  end

end
