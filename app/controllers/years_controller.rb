class YearsController < ApplicationController

  load_and_authorize_resource

  def index
    @years = Year.all
  end 

  def new
    @year = Year.new
  end 

  def edit
    
  end 

  def show

    id = params[:id]
    @year = Year.find(id)

  end 

  def create
    year_params

    @year = Year.new( year_params )

    if @year.save
      redirect_to @year
    end 

  end 

  def update
    if @year.update( year_params )
      redirect_to @year
    end 
  end 

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