class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      flash[:notice] = "Recipe saved!"
      redirect_to recipes_path
    else
      flash[:error] = "Unable to save"
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      flash[:notice] = "Recipe saved!"
      redirect_to recipes_path
    else
      flash[:error] = "Unable to save"
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    if @recipe.destroy
      flash[:notice] = "Recipe deleted"
      redirect_to recipes_path
    else
      flash[:error] = "Unable to delete recipe"
      redirect_back(fallback_location: recipes_path)
    end
  end

  def recipe_params
    params.require(:recipe).permit(:name, :link)
  end
end
