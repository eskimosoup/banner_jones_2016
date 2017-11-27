# frozen_string_literal: true

module Resources
  class Section < ApplicationRecord
    include OptimadminScopes

    belongs_to :resource,
               class_name: '::Resource'

    default_scope { positioned }

    mount_uploader :image, Resources::SectionUploader

    STYLES = ['basic'].freeze
    validates :style, inclusion: { in: STYLES }

    scope :positioned, -> { order(:position) }
    scope :displayed, (-> { where(display: true) })
  end
end
