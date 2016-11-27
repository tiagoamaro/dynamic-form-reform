class StatesController < ApplicationController
  def index
    redirect_to action: :new
  end

  def new
    @form = States::CreateForm.new(State.new)
    @form.prepopulate!(params[:states_create])
  end

  def create
    @form = States::CreateForm.new(State.new)

    if @form.validate(params[:states_create])
      @form.save
    end

    render :new
  end

  def destroy_all
    State.destroy_all

    redirect_to({ action: :new }, notice: 'Destroyed All States')
  end
end
