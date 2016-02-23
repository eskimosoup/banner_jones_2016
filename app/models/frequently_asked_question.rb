# FrequentlyAskedQuestion
class FrequentlyAskedQuestion < ActiveRecord::Base
  default_scope { positioned }

  validates :question, :answer, presence: true

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true) }

  has_many :service_faqs, dependent: :destroy
  has_many :services, through: :service_faqs
end
