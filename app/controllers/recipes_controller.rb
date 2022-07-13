class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end
  
  def create
  @recipe=  Recipe.new(name: params[:recipe][:name],
              recipe_type_id: params[:recipe][:recipe_type_id],
              cuisine: params[:recipe][:cuisine],
              ingredients: params[:recipe][:ingredients],
              cook_method: params[:recipe][:cook_method],
              cook_time: params[:recipe][:cook_time])

    if @recipe.save
      flash[:notice] = "Receita salva com sucesso"
      return redirect_to recipe_path(@recipe.id)
    end

  render :new

  end

  def edit
    @recipe =  Recipe.find(params[:id])
  end

  def update
    @recipe =  Recipe.find(params[:id])
    if @recipe.update(name: params[:recipe][:name],
                      recipe_type_id: params[:recipe][:recipe_type_id],
                      cuisine: params[:recipe][:cuisine],
                      ingredients: params[:recipe][:ingredients],
                      cook_method: params[:recipe][:cook_method],
                      cook_time: params[:recipe][:cook_time])
      flash[:notice] = "Receita editada com sucesso"
      return redirect_to recipe_path(@recipe.id)
    end

    render 'edit'
  end

  def publish
    @recipe =  Recipe.find(params[:id])
    @recipe.publicada!
    redirect_to recipe_path(@recipe.id)
  end

end