require 'rails_helper'


describe ShopsController do
  it "lets users create shops" do
    user = User.create!(email: "blah@gmail.com", password: "password", admin: true)
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

    it "user can delete shop" do
    user = User.create!(email: "blah@gmail.com", password: "password", admin: true)
    sign_in user

    shop = post :create, shop: {name: "New Shop", description: "awesome", location: "NC"}

    shop = Shop.last
    count = shop.user.shops.count
    response = delete :destroy, id: shop.id

    expect(response.status).to eq 302
    # List.find list.id works ...
    expect(shop.user.shops.count).to eq count
  end
end
