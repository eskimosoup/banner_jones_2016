module Optimadmin
  class DownloadPresenter < Optimadmin::BasePresenter
    presents :download
    delegate :id, :name, to: :download

    def toggle_title
      inline_detail_toggle_link(name)
    end

    def optimadmin_summary
      h.simple_format download.summary
    end
  end
end
