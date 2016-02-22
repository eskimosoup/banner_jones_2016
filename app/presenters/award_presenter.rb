class AwardPresenter < BasePresenter
  presents :award
  delegate :title, to: :award

  def image(image_type, options = {}, link_options = {})
    if link?
      link_tag image_tag(image_type, options), link_options
    else
      image_tag image_type, options
    end
  end

  private

  def link?
    award.link.present?
  end

  def image_tag(image_type, options = {})
    h.image_tag award.image.send(image_type), options
  end

  def link_tag(content, link_options = {})
    h.link_to content, award.link, link_options
  end
end
