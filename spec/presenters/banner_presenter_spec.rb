require 'rails_helper'
#  rspec --tag 'banner'
RSpec.describe BannerPresenter, type: :presenter, banner: true do
  let(:banner) { build(:banner) }
  subject(:banner_presenter) { BannerPresenter.new(object: banner, view_template: view) }

  describe 'delegations', :delegation do
    it { should delegate_method(:id).to(:banner) }
    it { should delegate_method(:title).to(:banner) }
  end

  describe 'standard banner' do
    it 'returns the summary - html formatted' do
      expect(banner_presenter.summary).to eq(simple_format(banner.summary))
    end

    it 'returns the banner image' do
      expect(banner_presenter.image).to eq(image_tag(banner.image.url))
    end

    it 'returns the banner image with options' do
      expect(banner_presenter.image(alt: 'Banner image', class: 'banner-image')).to eq(image_tag(banner.image.url, alt: 'Banner image', class: 'banner-image'))
    end

    it 'returns nil for button' do
      expect(banner_presenter.button).to eq(nil)
    end
  end

  describe 'banner with button' do
    let(:banner) { build(:banner_with_button) }
    subject(:banner_presenter) { BannerPresenter.new(object: banner, view_template: view) }

    it 'returns the default button' do
      expect(banner_presenter.button).to eq(link_to(banner.button_text, banner.button_link, title: banner.button_text))
    end

    it 'returns the button with options' do
      expect(banner_presenter.button(class: 'banner-button')).to eq(link_to(banner.button_text, banner.button_link, class: 'banner-button', title: banner.button_text))
    end
  end
end
