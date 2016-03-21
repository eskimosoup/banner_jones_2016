module DisplayStatus
  extend ActiveSupport::Concern

  included do
    enum status: { published: 1, scheduled: 2, expired: 3 }
    validates :publish_at, presence: true, if: proc { |x| x.has_attribute?('publish_at') }
    after_validation :manage_status, if: proc { |x| x.has_attribute?('publish_at') }
  end

  def manage_status
    self.status = if expire_at <= Time.zone.now
                    2
                  elsif publish_at <= Time.zone.now
                    1
                  else
                    3
                  end
    true
  end
end
