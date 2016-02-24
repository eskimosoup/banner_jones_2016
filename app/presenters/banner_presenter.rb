# BannerPresenter
class BannerPresenter < BasePresenter
  presents :banner
  delegate :id, :title, :button_text, :button_link, to: :banner

  def summary
    h.simple_format banner.summary if banner.summary.present?
  end

  def image(options = {})
    h.image_tag banner.image.url, options
  end

  def button(options = {})
    return unless button?
    h.link_to button_text, button_link, options.merge(title: button_text)
  end

  private

  def button?
    button_text.present? && button_link.present?
  end
end
