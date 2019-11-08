class MachinesController < ApplicationController
  ### Admin has crud access to this site using cancancan gem
  ### This controller is used to create a new tech machine such as laptop, computer, tablet etc

  load_and_authorize_resource
  

  def index
    @machines = Machine.all
  end 

  #### creates an object instance of machine
  def new
    @machine = Machine.new
  end 


  def edit
  end 

  def show

    id = params[:id]
    @machine = Machine.find(id)

  end 

  ### This will create a new machine provided it satisfies the parameters and then save to the database
  def create
    machine_params

    @machine = Machine.new( machine_params )

    if @machine.save
      redirect_to @machine
    else 
      render :new
    end 

  end 

#Machine can be updated and then saved to the database
  def update
    if @machine.update( machine_params )
      redirect_to @machine
    end 
  end 

# This provides the method for deleting from the database
  def destroy
    @machine.destroy

    redirect_to root_path
  end 


private

  def set_machine
    id = params[:id]
    @machine = Machine.find(id)
  end 

  def machine_params
    params.require(:machine).permit(:name)
  end 


end 