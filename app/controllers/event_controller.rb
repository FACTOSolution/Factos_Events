class EventController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, flash: { success: t('flash.create.success', entity: Event)}
    else
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to event_url, flash: { success: t('flash.destroy.success', entity: Event)}
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to @event, flash: { success: t('flash.update.success', entity: Event)}
    else
      render :edit
    end
  end

  private

  def event_params
    params.require(:event).permit(:date, :name, :description, :cover, :value_in_real,
      :address, :contact)
  end
end