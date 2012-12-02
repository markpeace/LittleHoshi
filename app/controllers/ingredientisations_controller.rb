class IngredientisationsController < ApplicationController

	before_filter :authenticate_admin!

  # GET /ingredientisations/new
  # GET /ingredientisations/new.json
  def new
    @ingredientisation = Ingredientisation.new
	@ingredientisation.activity=Activity.find(params[:activity_id])
	
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ingredientisation }
    end
  end

  # GET /ingredientisations/1/edit
  def edit
    @ingredientisation = Ingredientisation.find(params[:id])
  end

  # POST /ingredientisations
  # POST /ingredientisations.json
  def create
    @ingredientisation = Ingredientisation.new(params[:ingredientisation])

    respond_to do |format|
      if @ingredientisation.save
        format.html { redirect_to @ingredientisation.activity }
        format.json { render json: @ingredientisation, status: :created, location: @ingredientisation }
      else
        format.html { render action: "new" }
        format.json { render json: @ingredientisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ingredientisations/1
  # PUT /ingredientisations/1.json
  def update
    @ingredientisation = Ingredientisation.find(params[:id])

    respond_to do |format|
      if @ingredientisation.update_attributes(params[:ingredientisation])
        format.html { redirect_to @ingredientisation.activity }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ingredientisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredientisations/1
  # DELETE /ingredientisations/1.json
  def destroy
    @ingredientisation = Ingredientisation.find(params[:id])
	@activity=@ingredientisation.activity
    @ingredientisation.destroy

    respond_to do |format|
      format.html { redirect_to @activity }
      format.json { head :no_content }
    end
  end
end
