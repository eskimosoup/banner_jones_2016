module DisplayStatus
  extend ActiveSupport::Concern

  included do
    enum status: { published: 3, scheduled: 2, expired: 1 }
    validates :publish_at, presence: true
    validate :expire_after_publish, if: proc { |x| x.expire_at.present? }
    after_validation :manage_status
  end

  def manage_status
    self.status = if expire_at && expire_at <= Time.zone.now
                    'expired'
                  elsif publish_at <= Time.zone.now
                    'published'
                  else
                    'scheduled'
                  end
    true
  end

  def expire_after_publish
    errors.add(:expire_at, 'must be after the publish date') if expire_at <= publish_at
  end
end
