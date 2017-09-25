class EventController < ApplicationController
  respond_to :html, :json
  #before_action :authenticate_user!

  def index
    @events = Event.filter(params.slice(:type)).paginate(page: params[:page],
      per_page: 2)
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
      redirect_to event_path(@event), flash: { success: t('flash.create.success', entity: Event)}
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
    end
  end

  def search
    @events = Event.filter(search_params)
  end

  def publish
    @event = Event.find(params[:event_id])
    @event.published = true
    @event.event_status = 'approved'
    @event.save
  end

  def reject
    @event = Event.find(params[:event_id])
    @event.event_status = 'rejected'
    @event.save
  end

  def order
    @events = Event.ordered(ordering_params).published.paginate(page: params[:page],
      per_page: 10)
  end

  private

  def event_params
    params.require(:event).permit(:date, :name, :description, :image_url,
      :value, :address, :type, :contact, :user_id, :lat, :long, images_attributes: [:image_url])
  end

  def search_params
    params.permit(:name, :user_id, :date, :published)
  end

  def ordering_params
    params.permit(:date, :value)
  end
end
