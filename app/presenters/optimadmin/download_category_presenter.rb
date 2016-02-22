module Optimadmin
  class DownloadCategoryPresenter < Optimadmin::BasePresenter
    presents :download_category
    delegate :id, :title, to: :download_category
  end
end
