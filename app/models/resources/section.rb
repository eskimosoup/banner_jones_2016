# frozen_string_literal: true

module Resources
  class Section < ApplicationRecord
    include OptimadminScopes

    belongs_to :resource,
               class_name: '::Resource'

    default_scope { positioned }

    mount_uploader :image, Resources::SectionUploader

    STYLES = ['basic_page_summary', 'basic_ordered_list', 'basic_unordered_list', 'basic_text_block', 'basic_image_block', 'basic_other_articles', 'creative_page_summary', 'creative_ordered_list', 'creative_unordered_list', 'creative_text_block', 'creative_image_block', 'creative_other_articles', 'related_resources'].freeze
    validates :style, inclusion: { in: STYLES }

    scope :positioned, -> { order(:position) }
    scope :displayed, (-> { where(display: true) })
  end
end

