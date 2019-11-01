class SystemsController < ApplicationController
  load_and_authorize_resource
  

  def index
    @systems = System.all
  end 

  def new
    @system = System.new
  end 

  def edit

    
  end 

  def show

    id = params[:id]
    @system = System.find(id)

  end 

  def create
    system_params

    @system = System.new( system_params )

    if @system.save
      redirect_to @system
    end 

  end 

  def update
    if @system.update( system_params )
      redirect_to @system
    end 
  end 

  def destroy
    @system.destroy

    redirect_to root_path
  end 


private

  def set_system
    id = params[:id]
    @system = System.find(id)
  end 

  def system_params
    params.require(:system).permit(:name)
  end 


end 