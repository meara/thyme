class RecipePolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    # may want to change this so only the user who created the thing can modify it?
    user.present?
  end

  def edit?
    update?
  end

  def destroy?
    # may want to change this so only the user who created the thing can delete it?
    user.present?
  end

  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
