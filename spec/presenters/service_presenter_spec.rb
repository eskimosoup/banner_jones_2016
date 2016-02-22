require 'rails_helper'
#  rspec --tag 'service'
RSpec.describe ServicePresenter, type: :presenter, service: true do
  let(:service) { build(:service) }
  subject(:service_presenter) { ServicePresenter.new(object: service, view_template: view) }

  describe 'delegations', :delegation do
    it { should delegate_method(:title).to(:service) }
  end

  describe 'standard service' do
    it 'returns the linked title' do
      expect(service_presenter.linked_text(service.title, title: service.title)).to eq(link_to service.title, audience_department_service_path(service.department.audience, service.department, service), title: service.title)
    end

    it 'returns the summary - html formatted' do
      expect(service_presenter.summary).to eq((simple_format service.summary))
    end

    it 'returns the content - html escaped' do
      expect(service_presenter.content).to eq((raw service.content))
    end

    it 'returns the social share title' do
      expect(service_presenter.social_share_title).to eq(service.social_share_title)
    end

    it 'returns the social share description' do
      expect(service_presenter.social_share_description).to eq(service.social_share_description)
    end
  end

  describe 'service without social share fields' do
    let(:service) { build(:service, social_share_title: nil, social_share_description: nil) }

    it 'returns the social share title' do
      expect(service_presenter.social_share_title).to eq(service.title)
    end

    it 'returns the social share description' do
      expect(service_presenter.social_share_description).to eq(service.summary)
    end
  end

  describe 'images' do
    describe 'no image' do
      it 'show_image should return nil' do
        expect(service_presenter.show_image).to eq(nil)
      end

      it 'index_image should return nil' do
        expect(service_presenter.index_image).to eq(nil)
      end
    end

    describe 'has image' do
      let(:service) { build(:service_with_image) }
      subject(:service_presenter) { ServicePresenter.new(object: service, view_template: view) }

      it 'show_image should not return nil' do
        expect(service_presenter.show_image(alt: service.title)).to eq(image_tag(service.image.show, alt: service.title))
      end

      it 'index image should not return nil' do
        expect(service_presenter.index_image(alt: service.title)).to eq(image_tag(service.image.index, alt: service.title))
      end
    end
  end

  describe 'social share images' do
    describe 'no image' do
      it 'show_image should return nil' do
        expect(service_presenter.show_social_share_image).to eq(nil)
      end

      it 'returns nil for social share image' do
        expect(service_presenter.social_share_image_url).to eq(nil)
      end
    end

    describe 'has image' do
      let(:service) { build(:service_with_image) }
      subject(:service_presenter) { ServicePresenter.new(object: service, view_template: view) }

      it 'returns social share image url' do
        expect(service_presenter.social_share_image_url).to eq(root_url[0..-2] + service.social_share_image.show.url)
      end

      it 'show_image should not return nil' do
        expect(service_presenter.show_social_share_image(alt: service.title)).to eq(image_tag(service.social_share_image.show, alt: service.title))
      end
    end
  end
end
