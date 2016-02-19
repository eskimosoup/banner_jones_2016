class DownloadCategoryPresenter < BasePresenter
  presents :download_category
  delegate :name, to: :download_category
end
