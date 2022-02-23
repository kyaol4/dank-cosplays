class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def create?
    true
  end

  def update?
    user_is_owner? || user_is_admin?
  end
end

private

def user_is_owner?
  user == record.user
end

def user_is_admin?
  user.admin?
end
