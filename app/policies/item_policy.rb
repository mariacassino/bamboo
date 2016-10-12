class ItemPolicy < ApplicationPolicy

  def initialize(user, item)
    @user = user
    @item = item
  end

  def show?
    true
  end

  def random?
    show?
  end

  def new?
    create?
  end

  def create?
    is_seller? || shop_creator?
  end

  def edit?
    is_seller? || user.admin?
  end

  def update?
    is_seller? || user.admin?
  end

  def destroy?
    is_seller? || user.admin?
  end

  private


  def is_seller?
    user == item.user
  end

  def shop_creator?
    user == item.shop.user
  end



end
