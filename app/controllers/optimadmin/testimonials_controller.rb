module Optimadmin
  class TestimonialsController < Optimadmin::ApplicationController
    before_action :set_testimonial, only: [:show, :edit, :update, :destroy]

    edit_images_for Testimonial,
                    [
                      [:image, { show: ['fill', 40, 40] }]
                    ]

    def index
      @testimonials = Optimadmin::BaseCollectionPresenter.new(collection: Testimonial.where('content ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::TestimonialPresenter)
    end

    def show
    end

    def new
      @testimonial = Testimonial.new
    end

    def edit
    end

    def create
      @testimonial = Testimonial.new(testimonial_params)
      if @testimonial.save
        redirect_to_index_or_continue_editing(@testimonial)
      else
        render :new
      end
    end

    def update
      if @testimonial.update(testimonial_params)
        redirect_to_index_or_continue_editing(@testimonial)
      else
        render :edit
      end
    end

    def destroy
      @testimonial.destroy
      redirect_to testimonials_url, notice: 'Testimonial was successfully destroyed.'
    end

  private


    def set_testimonial
      @testimonial = Testimonial.find(params[:id])
    end

    def testimonial_params
      params.require(:testimonial).permit(:content, :author_name,
      :author_company, :image, :remove_image, :remote_image_url, :image_cache,
      :display, :position)
    end
  end
end
