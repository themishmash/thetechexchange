class MachinesController < ApplicationController
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

    @machine = current_user.machines.new( machine_params )

    if @machine.save
      redirect_to @machine
    end 

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