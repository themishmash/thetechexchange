class SystemsController < ApplicationController
  ### Admin has crud access to this site using cancancan gem
  ### This controller is used to create a new tech system such as OSX, Windows, etc.


  load_and_authorize_resource
  

  def index
    @systems = System.all
  end 

 #This creates the object instance @system 
  def new
    @system = System.new
  end 

  def edit

    
  end 

  def show

    id = params[:id]
    @system = System.find(id)

  end 

  #system can be updated and then saved to the database
  def create
    system_params

    @system = System.new( system_params )

    if @system.save
      redirect_to @system
    else 
      render :new
    end 

  end 

  def update
    if @system.update( system_params )
      redirect_to @system
    end 
  end 

# This provides the method for deleting from the database  
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