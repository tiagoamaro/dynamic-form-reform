class StatesController < ApplicationController
  def new
    @form = States::CreateForm.new(State.new)
    @form.prepopulate!(params)
  end

  def create
    @form = States::CreateForm.new(State.new)

    @form.validate(params[:states_create])
    render :new
  end
end
