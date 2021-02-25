class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # if user.admin?
      #   scope.all
      # else
      #   scope.where(user: user) # here, scope is equal to Restaurant
      # end
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  # # We don't need the edit? because it already exists
  # # in the application policy and will call the update?
  # 
  # def edit?
  #   # In Pundit, current_user is called user
  #   # and @restaurant is called record
  #   record.user == user
  # end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    record.user == user || user.admin?
  end
end
