class PostPolicy < ApplicationPolicy
  # NOTE: Up to Pundit v2.3.1, the inheritance was declared as
  # `Scope < Scope` rather than `Scope < ApplicationPolicy::Scope`.
  # In most cases the behavior will be identical, but if updating existing
  # code, beware of possible changes to the ancestors:
  # https://gist.github.com/Burgestrand/4b4bc22f31c8a95c425fc0e30d7ef1f5
  attr_reader :user, :post

    def initialize(user, post)
      @user = user
      @post = post
    end

    def index?
      false
    end

    def show?
      false
    end

    def create?
      @user.admin?
    end

    def new?
      create?
    end

    def update?
      @user.admin?
    end

    def edit?
      update?
    end

    def destroy?
      @user.admin?
    end


  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
