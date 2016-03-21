class Video < ActiveRecord::Base
  include DisplayStatus

  belongs_to :video_category

  validates :video_category, presence: true, if: proc { |x| x.new_record? }
  validates :title, :summary, :embed_code, presence: true

  scope :displayed, lambda {
    joins(:video_category)
      .published
      .merge(VideoCategory.published)
  }
end
