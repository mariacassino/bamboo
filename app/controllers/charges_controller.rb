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
    # :metadata    => { "Sold by" => "#{@item.user.email}"},
    :currency    => 'usd'
    )

    email

    rescue Stripe::CardError => e
      flash[:error] = e.message

      redirect_to new_charge_pathß
  end


  def email
    # TODO Create layout and dynamic content
    Pony.options = {
      :via => :smtp,
      :via_options => {
        :address => 'smtp.sendgrid.net',
        :port => '587',
        :domain => 'shop-bamboo.herokuapp.com',
        :user_name => ENV['SENDGRID_USERNAME'],
        :password => ENV['SENDGRID_PASSWORD'],
        :authentication => :plain,
        :enable_starttls_auto => true
      }
    }


    Pony.mail :to => 'jorgevp5@gmail.com',
    :from => "no-reply@shop-bamboo.herokuapp.com",
    :headers => { 'Content-Type' => 'text/html' },
    :subject => "Test Email",
    :body => "test"
  end

end
