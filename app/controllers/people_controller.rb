class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end

  def edit
    @person = Person.find(params[:id])
  end

  def create
  @person = Person.new(person_params)
    if @person.save
      redirect_to people_path
    else
      render :new
    end
  end

  def update
    # Take data from the form and update the page in our database
    @person = Person.find(params[:id])
    if @person.update(person_params)
      redirect_to people_path
      # successful update
    else
      # failed update
      render :edit
    end
  end

  def destroy
    # Finds the page by ID and removes it from the database
    Person.find(params[:id]).destroy
    redirect_to people_path
  end

  def person_params
    params.require(:person).permit(:name, :hair_color, :eye_color, :gender, :alive)
  end

end
