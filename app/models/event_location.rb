# EventLocation
class EventLocation < ActiveRecord::Base
  default_scope { order(building_name: :asc) }

  validates :building_name, :address_line_1, :city, :postcode, presence: true

  has_many :events, -> { displayed }, dependent: :nullify

  geocoded_by :address_fields
  # after_validation :geocode, if: lambda { |obj|
  #  obj.longitude.blank? ||
  #  (obj.address_line_1.present? && obj.address_line_1_changed?) ||
  #  (obj.address_line_2.present? && obj.address_line_2_changed?) ||
  #  (obj.city.present? && obj.city_changed?) ||
  #  (obj.postcode.present? && obj.postcode_changed?)
  # }

  def address_fields
    [address_line_1, address_line_2, city, postcode].reject(&:blank?)
                                                    .compact
                                                    .join(', ')
  end
end
