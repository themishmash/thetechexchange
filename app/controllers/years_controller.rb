class YearsController < ApplicationController
### Admin has crud access to this site using cancancan gem
### This controller is used to create a new tech year such as 2020, 2021, etc.

  load_and_authorize_resource

  def index
    @years = Year.all
  end 

  #### creates an object instance of year
  def new
    @year = Year.new
  end 

  def edit
    
  end 

  def show

    id = params[:id]
    @year = Year.find(id)

  end 

  ### This will create a new year provided it satisfies the parameters and then save to the database
  def create
    year_params

    @year = Year.new( year_params )

    if @year.save
      redirect_to @year
    else 
      render :new
    end 

  end 

### Year can be updated and then saved to the database 
  def update
    if @year.update( year_params )
      redirect_to @year
    end 
  end 


### This provides the method for deleting from the database
  def destroy
    
    @year.destroy
    redirect_to root_path
    
  end 


private

  def set_machine
    id = params[:id]
    @year = Year.find(id)
  end 

  def year_params
    params.require(:year).permit(:name)
  end 


end 