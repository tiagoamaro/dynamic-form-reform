class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def new
    @form = Cities::CreateForm.new(City.new)
    @form.prepopulate!(params[:cities_create])
  end

  def create
    @form = Cities::CreateForm.new(City.new)

    if @form.validate(params[:cities_create])
      @form.save

      redirect_to action: :index
    else
      render :new
    end
  end

  def destroy_all
    City.destroy_all

    redirect_to({ action: :index }, notice: 'Destroyed All Cities')
  end
end
