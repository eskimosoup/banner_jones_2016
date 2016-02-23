require 'rails_helper'

RSpec.describe BannerPresenter, type: :presenter, banner: true do
  let(:banner) { build(:banner) }
  subject(:banner_presenter) { BannerPresenter.new(object: banner, view_template: view) }

  pending "add some examples to (or delete) #{__FILE__}"
end
