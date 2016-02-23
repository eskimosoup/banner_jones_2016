# EventLocation
class EventLocation < ActiveRecord::Base
  default_scope { order(building_name: :asc) }

  validates :building_name, :address_line_1, :city, :postcode, presence: true

  has_many :events, dependent: :nullify

  geocoded_by :address_fields
  # after_validation :geocode, if: lambda { |obj|
  #   obj.longitude.blank? ||
  #   (
  #     obj.changed.present? &&
  #     obj.changed.to_set.intersect?(%w(address_line_1 address_line_2 city postcode).to_set)
  #   )
  # }

  def address_fields
    [address_line_1, address_line_2, city, postcode].reject(&:blank?)
                                                    .compact
                                                    .join(', ')
  end
end
