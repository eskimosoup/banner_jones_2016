class OfficeLocation < ActiveRecord::Base
  validates :name, presence: true, uniqueness: {
    case_sensitive: false,
    message: 'already exists'
  }

  scope :displayed, -> { where(display: true) }

  has_many :offices, dependent: :destroy
end
