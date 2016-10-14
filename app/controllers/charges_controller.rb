class ChargesController < ApplicationController

  def new
    if @item.on_sale = false
      @amount = @item.stripe_amount.to_i
    else
      @amount = @item.stripe_sale_amount.to_i
    end
  end

  def create
    # @shop = Shop.find(params[:id])
    @item = Item.find(params[:item_id])

    if @item.on_sale = false
      @amount = @item.stripe_amount.to_i
    else
      @amount = @item.stripe_sale_amount.to_i
    end

    customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :metadata    => {
      item: @item.name,
      description: @item.description
    },
    :currency    => 'usd',
    :receipt_email => customer.email
    )

    # TODO add Pony email functionality
    charge

    rescue Stripe::CardError => e
      flash[:error] = e.message

      # redirect_to new_charge_path
      redirect_to new_shop_item_charge_path
      # redirect_to shop_path(@shop)

  end


  # def email customer, charge
  #  # TODO Create layout and dynamic content
  #   Pony.options = {
  #     :via => :smtp,
  #     :via_options => {
  #       :address => 'smtp.sendgrid.net',
  #       :port => '587',
  #       :domain => 'bamboo-shopper.herokuapp.com',
  #       :user_name => ENV['SENDGRID_USERNAME'],
  #       :password => ENV['SENDGRID_PASSWORD'],
  #       :authentication => :plain,
  #       :enable_starttls_auto => true
  #     }
  #   }
  #
  #
  #   Pony.mail :to => customer.email,
  #   :from => "no-reply@bamboo-shopper.herokuapp.com",
  #   :headers => { 'Content-Type' => 'text/html' },
  #   :subject => "Receipt",
  #   :body => "Thank you for your purchase. You have purchased a #{charge.metadata.item} for $#{charge.amount / 100.00}"
  # end

end
