class EventsController < ApplicationController
  def index
    @only_todays_events = current_user.events.where.not('start_date <= ? AND end_date >= ?',
                                                        Date.today.midnight,
                                                        Date.tomorrow.midnight)
                                      .order('start_date')
    @all_day_events = current_user.events.where('start_date <= ? AND end_date >= ?',
                                                Date.today.midnight,
                                                Date.tomorrow.midnight)
  end

  def show
    @events = current_user.events.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params_event)
    @event.user = current_user
    @event.end_date += 1.day if params[:switchvalue] == 'all day'
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(params_event)
    redirect_to root_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end

  private

  def params_event
    params.require(:event).permit(:start_date, :end_date, :name, :description)
  end
end
