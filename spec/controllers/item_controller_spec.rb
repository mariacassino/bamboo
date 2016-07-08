require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  it "lets users create items" do
    user = User.create! email: "test@example.com", password: "hunter2"
    sign_in user

    old_count = user.items.count
    response = post :create, item: {name: 'test', description: "something", price: 46},  shop_id: 1

    expect(response.status).to eq 302
    expect(user.items.count).to eq old_count + 1
    expect(user.items.last.name).to eq 'test'

  end

  it "lets users delete items" do
    user = User.create! email: "test@example.com", password: "hunter2"
    sign_in user

    item_create = post :create, item: {name: 'test', description: "something", price: 46},  shop_id: 1

    old_count = user.items.count
    response = delete :destroy, shop_id: 1, id: user.items.last.id

    expect(user.items.count).to eq old_count - 1
  end

  it "lets users update items" do
    user = User.create! email: "test@example.com", password: "hunter2"
    sign_in user

    item_create = post :create, item: {name: 'test', description: "something", price: 46},  shop_id: 1

    update = post :update, item: {name: 'updated', description: "updated", price: 50}, shop_id: 1, id: user.items.last.id

    expect(user.items.count).to eq 1
    expect(user.items.last.name).to eq 'updated'
    expect(user.items.last.description).to eq 'updated'


  end

end
