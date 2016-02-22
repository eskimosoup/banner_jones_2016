class AudiencePresenter < BasePresenter
  presents :audience
  delegate :title, to: :audience
end
