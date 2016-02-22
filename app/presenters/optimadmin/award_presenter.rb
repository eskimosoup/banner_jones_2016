module Optimadmin
  class AwardPresenter < Optimadmin::BasePresenter
    presents :award
    delegate :id, :title, to: :award

    def toggle_title
      inline_detail_toggle_link(title)
    end
  end
end
