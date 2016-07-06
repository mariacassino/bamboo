class ApplicationPolicy
  attr_reader :user, :item, :shop

  def initialize(user, item, shop)
    @user = user
    @item = item
    @shop = shop
  end

  def index?
    true
  end

  def show?
    scope.where(:id => item.id).exists?
  end

  def create?
    true 
  end

  def new?
    create?
  end

  def update?
    true
  end

  def edit?
    update?
  end

  def destroy?
    true
  end

  def scope
    Pundit.policy_scope!(user, item.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
