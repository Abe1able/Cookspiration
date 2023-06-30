class RecipesController < ApplicationController
 
  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all.includes([:user])
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods.includes([:food])
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(params_recipe)
    @recipe.user_id = current_user.id

    if @recipe.save
      flash[:notice] = "Recipe was successfully created."
      redirect_to recipes_path
    else
      render :new
      flash[:notice] = 'Error creating recipe'
    end
  end



  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = 'The recipe was successfully destroyed'
    redirect_to recipes_path
  end

  def generate_list
    redirect_to shopping_list_path(params[:recipe_id])
  end

  private
    def params_recipe
      params.require(:recipe).permit(:name, :preparation_time, :description, :public, :cooking_time)
    end
end
