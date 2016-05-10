module ApplicationHelper
  def inline_editable(object)
    return unless current_administrator.present?
    content_for :javascript do
      render partial: 'optimadmin/shared/sidebar/inline_editing', locals: { object: object }
    end
  end

  def social_icon(type)
    return if global_site_settings["#{type} URL"].blank?
    link_to global_site_settings["#{type} URL"], title: type, class: "social-icon social-#{type.parameterize.dasherize}" do
      image_tag "components/icons/social/#{type.downcase.parameterize}.png", alt: type
    end
  end
end
