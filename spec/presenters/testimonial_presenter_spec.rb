require 'rails_helper'
#  rspec --tag 'testimonial'
RSpec.describe TestimonialPresenter, type: :presenter, testimonial: true do
  let(:testimonial) { build(:testimonial) }
  subject(:testimonial_presenter) { TestimonialPresenter.new(object: testimonial, view_template: view) }

  describe 'delegations', :delegation do
    it { should delegate_method(:author_name).to(:testimonial) }
    it { should delegate_method(:author_company).to(:testimonial) }
  end

  describe 'standard testimonial' do
    it 'returns the content - html escaped' do
      expect(testimonial_presenter.content).to eq(raw testimonial.content)
    end

    it 'returns the author' do
      expect(testimonial_presenter.author).to eq([testimonial.author_name, testimonial.author_company].reject{|x| x.blank? }.join(', '))
    end
  end

  describe 'images' do
    describe 'no image' do
      it 'show_image should return nil' do
        expect(testimonial_presenter.show_image).to eq(nil)
      end
    end

    describe 'has image' do
      let(:testimonial) { build(:testimonial_with_image) }
      subject(:testimonial_presenter) { TestimonialPresenter.new(object: testimonial, view_template: view) }

      it 'show_image should not return nil' do
        expect(testimonial_presenter.show_image(alt: testimonial_presenter.author)).to eq(image_tag(testimonial.image.show, alt: testimonial_presenter.author))
      end
    end
  end
end
