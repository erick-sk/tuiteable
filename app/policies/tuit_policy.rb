class TuitPolicy < ApplicationPolicy
  attr_reader :user, :tuit

  def initialize(user, tuit)
    @user = user
    @tuit = tuit
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def create?
    user.admin?
  end
end