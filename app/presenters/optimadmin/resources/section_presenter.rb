# frozen_string_literal: true

module Optimadmin
  module Resources
    class SectionPresenter
      include Optimadmin::PresenterMethods

      presents :section
      delegate :id, :title, to: :section

      def toggle_title
        inline_detail_toggle_link(title)
      end

      def optimadmin_summary
        # h.simple_format resources_section.summary
      end

      def edit_image(image)
        section.send(image).present? ? (h.link_to (h.image_tag section.send(image).thumb, alt: 'Edit'), h.edit_images_resource_resources_section_path(section.resource, section)) : 'File missing'
      end

      def edit_link
        h.link_to pencil, h.edit_resource_resources_section_path(section.resource, section), class: 'menu-item-control'
      end

      def delete_link
        h.link_to trash_can,
                  h.resource_resources_section_path(section.resource, section),
                  method: :delete,
                  data: { confirm: 'Are you sure?' },
                  class: 'menu-item-control'
      end
    end
  end
end
