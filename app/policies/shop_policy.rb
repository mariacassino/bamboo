class ShopPolicy < ApplicationPolicy

  def initialize(user, shop)
    @user = user
    @shop = shop
  end

  def show?
    true
  end

  def edit?
    # is_mod? || user.admin?
    is_seller?
  end

  def create?
    true
  end

  def update?
    # is_mod? || user.admin?
    is_seller?
  end

  def destroy?
    is_seller?
  end


  private

  def is_seller?
    user == shop.user
  end


end
