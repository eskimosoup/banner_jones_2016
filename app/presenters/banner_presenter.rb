class BannerPresenter < BasePresenter
  presents :banner
  delegate :id, to: :banner
end
