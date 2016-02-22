class ServicePresenter < BasePresenter
  presents :service
  delegate :title, to: :service

  def linked_text(text = 'View', options = {})
    h.link_to text, h.audience_department_service_path(service.department.audience, service.department, service), options
  end

  def summary
    h.simple_format service.summary
  end

  def content
    h.raw service.content
  end

  def social_share_image_url
    h.root_url[0..-2] + service.social_share_image.show.url if service.social_share_image.present?
  end

  def social_share_title
    service.social_share_title || service.title
  end

  def social_share_description
    service.social_share_description || service.summary
  end
end
