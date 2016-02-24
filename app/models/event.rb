# Event
class Event < ActiveRecord::Base
  default_scope { order(event_start: :desc) }

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  mount_uploader :image, EventUploader
  mount_uploader :social_share_image, SocialImageUploader

  validates :title, :summary, :event_start, :event_end, presence: true
  validates :event_location, :event_category, presence: true, if: proc { |x| x.new_record? }
  validates :booking_link, presence: true, if: :dates_and_booking_deadline?
  validate :end_after_start, :future_date, if: :dates?
  validate :booking_deadline_validation, if: :dates_and_booking_deadline?

  validates :suggested_url, allow_blank: true, uniqueness: {
    case_sensitive: false,
    message: 'is already taken, leave blank to generate automatically'
  }

  scope :displayed, lambda {
    joins(:event_category)
      .where(display: true)
      .where('event_end >= ?', DateTime.now)
      .merge(EventCategory.displayed)
  }

  belongs_to :event_category
  belongs_to :event_location

  has_many :service_events, dependent: :destroy
  has_many :services, -> { displayed }, through: :service_events

  def end_after_start
    errors.add(:event_end, "can't be before event start") if event_start > event_end
  end

  def future_date
    errors.add(:event_start, "can't be in the past") if event_start < DateTime.now && new_record?
  end

  def booking_deadline_validation
    if booking_deadline < event_start
      errors.add(:booking_deadline, 'must be after the event start')
    elsif booking_deadline > event_end
      errors.add(:booking_deadline, 'must be before the event end')
    end
  end

  def dates?
    event_start.present? && event_end.present?
  end

  def dates_and_booking_deadline?
    dates? && booking_deadline.present?
  end

  def slug_candidates
    [
      :suggested_url,
      :title,
      [:suggested_url, :title]
    ]
  end

  def should_generate_new_friendly_id?
    slug.blank? || suggested_url_changed? || title_changed?
  end
end
