require 'rails_helper'

RSpec.describe DownloadCategoryPresenter, type: :presenter, download_category: true do
  let(:download_category) { build(:download_category) }
  subject(:download_category_presenter) { DownloadCategoryPresenter.new(object: download_category, view_template: view) }

  describe 'delegations', :delegation do
    it { should delegate_method(:title).to(:download_category) }
  end
end
