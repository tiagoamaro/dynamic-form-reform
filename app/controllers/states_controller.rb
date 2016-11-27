class StatesController < ApplicationController
  def index
    @states = State.all
  end

  def new
    @form = States::CreateForm.new(State.new)
    @form.prepopulate!(params[:states_create])
  end

  def create
    @form = States::CreateForm.new(State.new)

    if @form.validate(params[:states_create])
      @form.save

      redirect_to action: :index
    else
      render :new
    end
  end

  def destroy_all
    State.destroy_all

    redirect_to({ action: :index }, notice: 'Destroyed All States')
  end
end
