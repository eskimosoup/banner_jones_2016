module ApplicationHelper
  def inline_editable(object)
    return unless current_administrator.present?
    content_for :javascript do
      render partial: 'optimadmin/shared/sidebar/inline_editing', locals: { object: object }
    end
  end

  def social_icon(type)
    return if global_site_settings["#{type} URL"].blank?
    link_to global_site_settings["#{type} URL"], title: type, class: "social-icon social-#{type.parameterize.dasherize}", target: '_blank' do
      image_tag "components/icons/social/#{type.downcase.parameterize}.png", alt: type
    end
  end

  def possessive(string)
    sanitize (string + ('s' == string[-1, 1] ? '&#8217;' : '&#8217;s'))
  end

  def module_show_content_classes(collection)
    classes = ['module-show-content']
    classes << 'wide' if collection.present?
    classes.join(' ')
  end
end
