class OfficeLocation < ActiveRecord::Base
  include DisplayStatus

  validates :name, presence: true, uniqueness: {
    case_sensitive: false,
    message: 'already exists'
  }

  scope :displayed, -> { published }

  has_many :offices, -> { displayed }, dependent: :destroy
end
