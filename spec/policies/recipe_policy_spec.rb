require "rails_helper"

describe RecipePolicy do
  subject { described_class }

  permissions :index?, :show? do
    it "grants always access" do
      expect(subject).to permit(nil, Recipe.new(name: "Spaghetti Carbonara"))
    end
  end

  permissions :create?, :new?, :update?, :edit?, :destroy? do
    it "grants access if user is logged in" do
      expect(subject).to permit(User.new, Recipe.new(name: "Spaghetti Carbonara"))
    end
  end
end
