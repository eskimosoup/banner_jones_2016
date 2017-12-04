# frozen_string_literal: true

module Optimadmin
  module Resources
    class SectionsController < Optimadmin::ApplicationController
      before_action :set_resource
      before_action :set_section, only: %i[show edit update destroy]

       edit_images_for ::Resources::Section,
                      [
                        [:image, {
                          show: ['fit', 200, 200],
                          index: ['fit', 200, 200]
                        }]
                      ]

      def index
        @sections = @resource.sections.field_order(params[:order])
                                        .field_search(params[:search])
                                        .pagination(params[:page], params[:per_page])
      end

      def show; end

      def new
        @section = @resource.sections.new
      end

      def edit; end

      def create
        @section = @resource.sections.new(section_params)
        if @section.save
          redirect_to_index_or_continue_editing(@section)
        else
          render :new
        end
      end

      def update
        if @section.update(section_params)
          redirect_to_index_or_continue_editing(@section)
        else
          render :edit
        end
      end

      def destroy
        @section.destroy
        redirect_to sections_url, notice: 'Section was successfully destroyed.'
      end

      private

      def set_resource
        @resource = ::Resource.find(params[:resource_id])
      end

      def set_section
        @section = ::Resources::Section.find(params[:id])
      end

      def section_params
        params.require(:resources_section).permit(
          :resource_id, :position, :title, :content, :image, :style, :display,
          :remove_image, :remote_image_url, :image_cache
        )
      end
    end
  end
end
