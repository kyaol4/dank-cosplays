class CostumePolicy < ApplicationPolicy
  class Scope < Scope
      # NOTE: Be explicit about which records you allow access to!
      # def resolve
      #   scope.all
      # end
    # [:index, :show, :new, :create, :destroy]

    def resolve
      scope.all
      # We want to filter only the records that the user is allowed to access, e.g.
      # scope.where(user: user)
      # scope.where(published: true)
      # scope.where(archived: false)
    end
  end

  def index
    @costumes = policy_scope(Costume).order(created_at: :desc)
  end

  def show?
    return true
  end

  def new?
    create?
  end

  def create?
    return true
  end

  def destroy?
    user_is_owner? || user_is_admin?
  end

  private

  def user_is_owner?
    user == record.user
  end

  def user_is_admin?
    user.admin?
  end
end
