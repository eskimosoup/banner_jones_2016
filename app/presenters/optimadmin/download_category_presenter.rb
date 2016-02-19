module Optimadmin
  class DownloadCategoryPresenter < Optimadmin::BasePresenter
    presents :download_category
    delegate :id, :name, to: :download_category
  end
end
