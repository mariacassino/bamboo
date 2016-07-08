require 'rails_helper'


describe ShopsController do
  it "lets users create shops" do
    user = User.create!(email: "blah@gmail.com", password: "password")
    sign_in user

    # expect do
    #   response = post :create, title: "New List"
    # end.to change { user.lists.count }.by 1

    old_count = user.shops.count
    response = post :create, shop: {name: "New Shop", description: "awesome", location: "NC"}

    expect(response.status).to eq 302
    expect(user.shops.count).to eq old_count + 1
    expect(user.shops.last.name).to eq "New Shop"
  end



    it "lets users edit shops" do
    user = User.create!(email: "blah@gmail.com", password: "password")
    sign_in user

    shop = post :create, shop: {name: "New Shop", description: "awesome", location: "NC"}
    update = post :update, shop: {name: "BRAND NEW SHOP", description: "even more awesome", location: "someplace cooler"}, id: user.shops.last.id

    expect(user.shops.count).to eq 1
    expect(user.shops.last.name).to eq "BRAND NEW SHOP"
    expect(user.shops.last.description).to eq "even more awesome"
    expect(user.shops.last.location).to eq  "someplace cooler"
  end



    it "lets users delete shops" do
    user = User.create!(email: "blah@gmail.com", password: "password")
    sign_in user

    shop = post :create, shop: {name: "New Shop", description: "awesome", location: "NC"}

    shop = Shop.last
    count = shop.user.shops.count
    response = delete :destroy, id: shop.id

    expect(response.status).to eq 302
    # List.find list.id works ...
    expect(shop.user.shops.count).to eq count - 1
  end



    it "doesn't let users delete other users' shops" do
    me = User.create!(email: "maria@gmail.com", password: "password")
    sign_in me
    myshop = post :create, shop: {name: "My Shop", description: "my awesome shop",
      location: "my town"}
    sign_out me

    them = User.create!(email: "someone@gmail.com", password: "password")
    sign_in them
    theirshop = post :create, shop: {name: "Their Shop", description: "their awesome shop",
      location: "their town"}

    shop_count = Shop.all.count
    response = delete :destroy, id: me.shops.last.id

    expect(response.status).to eq 302
    expect(Shop.all.count).to eq shop_count
  end


    it "lets site admins delete any users' shops" do
    user = User.create!(email: "maria@gmail.com", password: "password")
    sign_in user
    usershop = post :create, shop: {name: "User Shop", description: "my awesome shop",
      location: "my town"}
    sign_out user

    admin = User.create!(email: "someone@gmail.com", password: "password", admin: true)
    sign_in admin
    # theirshop = post :create, shop: {name: "Their Shop", description: "their awesome shop",
    #   location: "their town"}

    shop_count = Shop.all.count
    response = delete :destroy, id: user.shops.last.id

    expect(response.status).to eq 302
    expect(Shop.all.count).to eq shop_count -1
  end


  it "lets site admins edit any users' shops" do
  user = User.create!(email: "maria@gmail.com", password: "password")
  sign_in user
  usershop = post :create, shop: {name: "User Shop", description: "my awesome shop",
    location: "my town"}
  sign_out user

  admin = User.create!(email: "someone@gmail.com", password: "password", admin: true)
  sign_in admin

  update = post :update, shop: {name: "BRAND NEW SHOP", description: "even more awesome",
    location: "someplace cooler"}, id: user.shops.last.id

  expect(user.shops.count).to eq 1
  expect(user.shops.last.name).to eq "BRAND NEW SHOP"
  expect(user.shops.last.description).to eq "even more awesome"
  expect(user.shops.last.location).to eq  "someplace cooler"
end

end
