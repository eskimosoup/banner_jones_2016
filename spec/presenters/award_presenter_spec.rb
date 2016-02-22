require 'rails_helper'
#  rspec --tag 'award'
RSpec.describe AwardPresenter, type: :presenter, award: true do
  let(:award) { build(:award) }
  subject(:award_presenter) { AwardPresenter.new(object: award, view_template: view) }

  describe 'delegations', :delegation do
    it { should delegate_method(:title).to(:award) }
  end

  describe 'standard award' do
    it 'returns the image' do
      expect(award_presenter.image('index')).to eq(image_tag(award.image.index))
    end

    it 'returns the image with options' do
      expect(award_presenter.image('index', alt: award.title)).to eq(image_tag(award.image.index, alt: award.title))
    end

    describe 'has link' do
      let(:award) { build(:award_with_link) }
      subject(:award_presenter) { AwardPresenter.new(object: award, view_template: view) }

      it 'returns the image with link' do
        expect(award_presenter.image('index')).to eq(link_to((image_tag award.image.index), award.link))
      end

      it 'returns the image with link including link and image options' do
        expect(award_presenter.image('index', { alt: award.title }, title: award.title)).to eq(link_to((image_tag award.image.index, alt: award.title), award.link, title: award.title))
      end
    end
  end

  describe 'images' do
    describe 'has image' do
      let(:award) { build(:award) }
      subject(:award_presenter) { AwardPresenter.new(object: award, view_template: view) }

      it 'show_image should not return nil' do
        expect(award_presenter.show_image(alt: award.title)).to eq(image_tag(award.image.show, alt: award.title))
      end

      it 'index image should not return nil' do
        expect(award_presenter.index_image(alt: award.title)).to eq(image_tag(award.image.index, alt: award.title))
      end
    end
  end
end
