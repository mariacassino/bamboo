class ItemPolicy < ApplicationPolicy

  def initialize(user, item)
    @user = user
    @item = item
  end


  def show?
    true
  end

  def new?
    create?
  end

  def create?
    is_seller?
  end

  def edit?
    is_seller?
  end

  def update?
    is_seller?
  end

  def destroy?
    is_seller?
  end

  private


  def is_seller?
    user == item.user
  end



end
