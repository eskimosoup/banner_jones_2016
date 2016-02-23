module Optimadmin
  class BannerPresenter < Optimadmin::BasePresenter
    presents :banner
    delegate :id, :title, to: :banner

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.link_to banner.button_text, banner.button_link
    end
  end
end
