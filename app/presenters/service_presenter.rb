class ServicePresenter < BasePresenter
  presents :service
  delegate :title, :colour, :audience, :onpage_navigations, to: :service

  def linked_text(text = 'View', options = {})
    # :sob:
    if service.parent.present? && service.parent.parent.present?
      h.link_to text, h.audience_child_service_path(service.audience, service.parent.parent, service.parent, service), options
    elsif service.parent.present?
      h.link_to text, h.audience_service_service_path(service.audience, service.parent, service), options
    else
      h.link_to text, h.audience_service_path(service.audience, service), options
    end
  end

  def summary
    h.simple_format service.summary
  end

  def content
    h.raw service.content
  end

  def social_share_image_url
    social_share_image_setter
  end

  def social_share_title
    service.social_share_title || service.title
  end

  def social_share_description
    service.social_share_description || service.summary
  end

  def colour_property_helper(property)
    return if colour.blank?
    "#{property}: #{colour};"
  end

  def colour
    if service.colour.present?
      service.colour
    elsif service.colour.blank? && service.audience.present?
      service.audience.colour
    end
  end

  private

  def social_share_image_setter
    if service.social_share_image.present?
      h.root_url[0..-2] + service.social_share_image.show.url
    elsif service.image.present? && service.image.show.present?
      h.root_url[0..-2] + service.image.show.url
    end
  end
end
