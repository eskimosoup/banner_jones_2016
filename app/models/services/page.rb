module Services
  class Page < ApplicationRecord
    include Presentable, OptimadminScopes, DisplayStatus

    default_scope { order(title: :asc) }

    LAYOUTS = %w(application wealth_management_2018 notary_2018).freeze
    STYLES  = %w(basic service_large stamp_duty_calculator).freeze

    extend FriendlyId
    friendly_id :slug_candidates, use: [:slugged, :history, :scoped], scope: :service

    mount_uploader :image, ServicePageUploader
    mount_uploader :social_share_image, SocialImageUploader

    validates :title, :service, presence: true
    validates :layout, presence: true, inclusion: { in: LAYOUTS }
    validates :style, presence: true, inclusion: { in: STYLES }
    validates :suggested_url, allow_blank: true, uniqueness: {
      case_sensitive: false,
      message: 'is already taken, leave blank to generate automatically',
      scope: :service_id
    }

    scope :displayed, -> { published }

    belongs_to :service

    has_many :onpage_services_pages, dependent: :destroy, class_name: '::OnpageNavigations::ServicePage', foreign_key: :services_page_id
    has_many :onpage_navigations, through: :onpage_services_pages

    def slug_candidates
      [
        :suggested_url,
        :title,
        [:suggested_url, :title]
      ]
    end

    def should_generate_new_friendly_id?
      if slug.blank? || suggested_url_changed? || title_changed?
        true
      else
        false
      end
    end
  end
end
