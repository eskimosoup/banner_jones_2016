class DownloadCategoryPresenter < BasePresenter
  presents :download_category
  delegate :title, to: :download_category
end
