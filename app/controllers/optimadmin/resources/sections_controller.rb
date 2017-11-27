# frozen_string_literal: true

module Optimadmin
  module Resources
    class SectionsController < Optimadmin::ApplicationController
      before_action :set_resources_section, only: %i[show edit update destroy]

      def index
        @resources_sections = ::Resources::Section.field_order(params[:order])
                                                .field_search(params[:search])
                                                .pagination(params[:page], params[:per_page])
            end

      def show; end

      def new
        @resources_section = ::Resources::Section.new
      end

      def edit; end

      def create
        @resources_section = ::Resources::Section.new(resources_section_params)
        if @resources_section.save
          redirect_to_index_or_continue_editing(@resources_section)
        else
          render :new
        end
      end

      def update
        if @resources_section.update(resources_section_params)
          redirect_to_index_or_continue_editing(@resources_section)
        else
          render :edit
        end
      end

      def destroy
        @resources_section.destroy
        redirect_to resources_sections_url, notice: 'Section was successfully destroyed.'
      end

      private

      def set_resources_section
        @resources_section = ::Resources::Section.find(params[:id])
      end

      def resources_section_params
        params.require(:resources_section).permit(
          :resource_id, :position, :title, :content, :image, :style, :display,
          :remove_image, :remote_image_url, :image_cache
        )
      end
    end
  end
end
