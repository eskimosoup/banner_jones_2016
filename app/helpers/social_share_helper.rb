module SocialShareHelper
  def social_share_attributions(twitter_card, og_type)
    tag_builder 'twitter:site', global_site_settings['Twitter'] if global_site_settings['Twitter'].present?
    tag_builder 'twitter:card', twitter_card
    tag_builder 'og:site_name', global_site_settings['Name']
    tag_builder 'og:url', request.original_url
    tag_builder 'og:type', og_type
    tag_builder 'og:locale', 'en_GB'
  end

  def og_title(content, twitter_card = 'summary_large_image', og_type = 'website')
    social_share_attributions twitter_card, og_type
    tag_builder 'og:title', content
    tag_builder 'twitter:title', content
  end

  def og_description(content)
    tag_builder 'og:description', content
    tag_builder 'twitter:description', content
  end

  def og_image(content)
    tag_builder 'og:image', content
    tag_builder 'twitter:image', content
  end

  def twitter_creator(content)
    tag_builder 'twitter:creator', content
  end

  def tag_builder(property, content)
    content_for :head do
      concat "\n  "
      concat tag :meta, property: property, content: content
    end
  end
end
