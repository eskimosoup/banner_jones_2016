class AudienceConstraint
  def initialize(model)
    @model = model
  end

  def matches?(request)
    slug_exists?(request)
  end

  private

  attr_reader :model

  def slug_exists?(request)
    requested_slug = request.path_parameters[:audience_id].present? ? request.path_parameters[:audience_id] : request.path_parameters[:id]

    FriendlyId::Slug.where(sluggable_type: model.to_s).exists?(slug: requested_slug)
  end
end
