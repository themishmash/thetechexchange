class MachinesController < ApplicationController
  ### Admin has crud access to this site using cancancan gem

  load_and_authorize_resource
  

  def index
    @machines = Machine.all
  end 

  def new
    @machine = Machine.new
  end 

  def edit
  end 

  def show

    id = params[:id]
    @machine = Machine.find(id)

  end 

  def create
    machine_params

    @machine = Machine.new( machine_params )

    if @machine.save
      redirect_to @machine
    else 
      render :new
    end 

  end 

  def update
    if @machine.update( machine_params )
      redirect_to @machine
    end 
  end 

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