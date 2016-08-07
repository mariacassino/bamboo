require 'rails_helper'


describe ShopsController do

  it "lets users create shops" do
    user = create :user
    sign_in user

    old_count = user.shops.count
    response = post :create, shop: {name: "New Shop", description: "awesome", location: "NC"}

    expect(response.status).to eq 302
    expect(user.shops.count).to eq old_count + 1
    expect(user.shops.last.name).to eq "New Shop"
  end



    it "lets users edit their own shops" do
    user = create :user
    sign_in user

    shop = post :create, shop: {name: "New Shop", description: "awesome", location: "NC"}
    update = post :update, shop: {name: "BRAND NEW SHOP", description: "even more awesome",
      location: "someplace cooler"}, id: user.shops.last.id

    expect(user.shops.count).to eq 1
    expect(user.shops.last.name).to eq "BRAND NEW SHOP"
    expect(user.shops.last.description).to eq "even more awesome"
    expect(user.shops.last.location).to eq  "someplace cooler"
  end



    it "doesn't let users edit other users' shops" do
      shop = create :shop
      user = shop.user
      shop = shop.user.shops.last
      sign_out user

      other = create :user
      sign_in other

    update = post :update, shop: {name: "BRAND NEW SHOP", description: "even more awesome",
      location: "someplace cooler"}, id: user.shops.last.id

    expect(user.shops.last.name).to eq "User Shop"
    expect(user.shops.last.description).to eq "my awesome shop"
    expect(user.shops.last.location).to eq  "my town"
  end



    it "lets users delete shops" do
    user = create :user
    sign_in user

    shop = post :create, shop: {name: "New Shop", description: "awesome", location: "NC"}

    shop = Shop.last
    count = shop.user.shops.count
    response = delete :destroy, id: user.shops.last.id

    expect(response.status).to eq 302
    expect(shop.user.shops.count).to eq count - 1
  end



    it "doesn't let users delete other users' shops" do
    me = create :user
    sign_in me
    myshop = post :create, shop: {name: "My Shop", description: "my awesome shop",
      location: "my town"}
    sign_out me

    them = create :user
    sign_in them
    theirshop = post :create, shop: {name: "Their Shop", description: "their awesome shop",
      location: "their town"}

    shop_count = Shop.all.count
    response = delete :destroy, id: me.shops.last.id

    expect(response.status).to eq 302
    expect(Shop.all.count).to eq shop_count
  end



    it "lets site admins edit any users' shops" do
    usershop = create :shop
    user = usershop.user

    admin = create :admin
    sign_in admin

    update = post :update, shop: {name: "BRAND NEW SHOP", description: "even more awesome",
      location: "someplace cooler"}, id: user.shops.last.id

    expect(user.shops.count).to eq 1
    expect(user.shops.last.name).to eq "BRAND NEW SHOP"
    expect(user.shops.last.description).to eq "even more awesome"
    expect(user.shops.last.location).to eq  "someplace cooler"
  end



    it "lets site admins delete any users' shops" do
    usershop = create :shop
    user = usershop.user

    admin = create :admin
    sign_in admin

    shop_count = Shop.all.count
    response = delete :destroy, id: user.shops.last.id

    expect(response.status).to eq 302
    expect(Shop.all.count).to eq shop_count -1
  end



end
