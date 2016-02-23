module Optimadmin
  class EventsController < Optimadmin::ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :destroy]

    edit_images_for Event,
                    [
                      [:image, { show: ['fit', 200, 200], index: ['fill', 200, 200] }],
                      [:social_share_image, { show: ['fit', 1200, 600] }]
                    ]

    def index
      @events = Optimadmin::BaseCollectionPresenter.new(collection: Event.where('title ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::EventPresenter)
    end

    def show
    end

    def new
      @event = Event.new
    end

    def edit
    end

    def create
      @event = Event.new(event_params)
      if @event.save
        redirect_to_index_or_continue_editing(@event)
      else
        render :new
      end
    end

    def update
      if @event.update(event_params)
        redirect_to_index_or_continue_editing(@event)
      else
        render :edit
      end
    end

    def destroy
      @event.destroy
      redirect_to events_url, notice: 'Event was successfully destroyed.'
    end

    private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :summary, :content, :event_start,
                                    :remote_social_share_image_url, :remove_social_share_image, :social_share_image_cache,
                                    :remote_image_url, :remove_image, :image_cache,
                                    :event_end, :booking_link, :booking_deadline,
                                    :event_category_id, :event_location_id,
                                    :image, :social_share_title, :social_share_description,
                                    :social_share_image, :slug, :suggested_url, :display)
    end
  end
end
