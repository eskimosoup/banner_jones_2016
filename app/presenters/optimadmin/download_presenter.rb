module Optimadmin
  class DownloadPresenter < Optimadmin::BasePresenter
    presents :download
    delegate :id, :title, to: :download

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.simple_format download.summary
    end
  end
end
