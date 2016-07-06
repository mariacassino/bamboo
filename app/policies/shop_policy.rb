class ShopPolicy < ApplicationPolicy

  def initialize(user, shop)
    @user = user
    @shop = shop
  end

  def show?
    true
  end

  def edit?
    is_seller? || user.admin?
  end

  def create?
    true
  end

  def update?
    is_seller? || user.admin?
  end

  def destroy?
    is_seller? || user.admin?
  end


  private

  def is_seller?
    user == shop.user
  end


end
