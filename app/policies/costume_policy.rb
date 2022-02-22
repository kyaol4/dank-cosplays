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

  def index?

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

  end

  private

  def user_is_owner?
    user == record.user
  end

end
