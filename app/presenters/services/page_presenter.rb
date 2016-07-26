module Services
  class PagePresenter < BasePresenter
    presents :service_page
    delegate :title, to: :service_page

    def linked_text(text = 'View', options = {})
      h.link_to text, h.audience_service_service_page_path(service_page.service.audience, service_page.service, service_page), options
    end

    def summary
      h.raw service_page.summary
    end

    def content
      h.raw service_page.content
    end

    def social_share_image_url
      social_share_image_setter
    end

    def social_share_title
      service_page.social_share_title || service_page.title
    end

    def social_share_description
      service_page.social_share_description || service_page.summary
    end

    private

    def social_share_image_setter
      if service_page.social_share_image.present?
        h.root_url[0..-2] + service_page.social_share_image.show.url
      elsif service_page.image.present? && service_page.image.show.present?
        h.root_url[0..-2] + service_page.image.show.url
      end
    end
  end
end
