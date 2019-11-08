class ConditionsController < ApplicationController
### Admin has CRUD access using cancancan gem.
### This controller is used to create a new tech condition such as new, used, etc

  load_and_authorize_resource
  

  def index
    @conditions = Condition.all
  end 

  def new
    @condition = Condition.new
  end 

  def edit

    
  end 

  def show

    id = params[:id]
    @condition = Condition.find(id)

  end 

  def create
    condition_params

    @condition = Condition.new( condition_params )

    if @condition.save
      redirect_to @condition
    else 
      render :new
    end 

  end 

  def update
    if @condition.update( condition_params )
      redirect_to @condition
    end 
  end 

  def destroy
    @condition.destroy

    redirect_to root_path
  end 


private

  def set_condition
    id = params[:id]
    @condition = Condition.find(id)
  end 

  def condition_params
    params.require(:condition).permit(:condition)
  end 


end 