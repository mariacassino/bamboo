require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  it "lets users create items" do
    shop = create :shop
    user = shop.user
    sign_in user

    old_count = shop.items.count
    response = post :create, item: {name: 'test', description: "something", price: 46},  shop_id: shop.id

    expect(response.status).to eq 302
    expect(user.items.count).to eq old_count + 1
    expect(user.items.last.name).to eq 'test'
  end


  # it "lets users delete items" do
  #   shop = item.shop
  #   user = item.user
  #   item = user.items.last
  #   sign_in user
  #
  #   old_count = Item.all.count
  #   response = delete :destroy, item_id: item.id
  #
  #   expect(user.items.count).to eq old_count - 1
  # end


  it "lets users update items" do
    item = create :item
    user = item.user
    sign_in user

    update = post :update, item: {name: 'updated', description: "updated", price: 50}, shop_id: item.shop.id, id: item.id

    expect(user.items.count).to eq 1
    expect(user.items.last.name).to eq 'updated'
    expect(user.items.last.description).to eq 'updated'
  end

  # it "lets users put items on clearance" do
  #   item = create :item
  #   user = item.user
  #   sign_in user
  #
  #   post :patch, item: {sale_length: 10}
  #
  #   expect(item.sale_length).to eq 10
  #
  # end

end
