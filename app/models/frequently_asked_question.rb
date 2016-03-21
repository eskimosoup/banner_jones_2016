# FrequentlyAskedQuestion
class FrequentlyAskedQuestion < ActiveRecord::Base
  include DisplayStatus

  default_scope { positioned }

  validates :question, :answer, presence: true

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { published.positioned }

  has_many :service_faqs, dependent: :destroy
  has_many :services, through: :service_faqs
end
