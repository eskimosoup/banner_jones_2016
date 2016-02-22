require 'rails_helper'
#  rspec --tag 'article'
RSpec.describe ArticlePresenter, type: :presenter, article: true do
  let(:article) { build(:article) }
  subject(:article_presenter) { ArticlePresenter.new(object: article, view_template: view) }

  describe 'delegations', :delegation do
    it { should delegate_method(:title).to(:article) }
  end

  describe 'standard article' do
    it 'returns the linked title' do
      expect(article_presenter.linked_text(article.title)).to eq(link_to article.title, article)
    end

    it 'returns the summary - html formatted' do
      expect(article_presenter.summary).to eq(simple_format article.summary)
    end

    it 'returns the content - html escaped' do
      expect(article_presenter.content).to eq(raw article.content)
    end

    it 'returns the social share title' do
      expect(article_presenter.social_share_title).to eq(article.social_share_title)
    end

    it 'returns the social share description' do
      expect(article_presenter.social_share_description).to eq(article.social_share_description)
    end

    describe 'date formatting' do
      it 'should return the date with default format' do
        expect(article_presenter.date).to eq(l article.date, format: :default)
      end

      it 'should return the date with short format' do
        expect(article_presenter.date(:short)).to eq(l article.date, format: :short)
      end

      it 'should return the date with long format' do
        expect(article_presenter.date(:long)).to eq(l article.date, format: :long)
      end
    end
  end

  describe 'article without social share fields' do
    let(:article) { build(:article, social_share_title: nil, social_share_description: nil) }

    it 'returns the social share title' do
      expect(article_presenter.social_share_title).to eq(article.title)
    end

    it 'returns the social share description' do
      expect(article_presenter.social_share_description).to eq(article.summary)
    end
  end

  describe 'images' do
    describe 'no image' do
      it 'show_image should return nil' do
        expect(article_presenter.show_image).to eq(nil)
      end

      it 'index_image should return nil' do
        expect(article_presenter.index_image).to eq(nil)
      end
    end

    describe 'has image' do
      let(:article) { build(:article_with_image) }
      subject(:article_presenter) { ArticlePresenter.new(object: article, view_template: view) }

      it 'show_image should not return nil' do
        expect(article_presenter.show_image(alt: article.title)).to eq(image_tag(article.image.show, alt: article.title))
      end

      it 'index image should not return nil' do
        expect(article_presenter.index_image(alt: article.title)).to eq(image_tag(article.image.index, alt: article.title))
      end
    end
  end

  describe 'social share images' do
    describe 'no image' do
      it 'show_image should return nil' do
        expect(article_presenter.show_image).to eq(nil)
      end

      it 'returns nil for social share image' do
        expect(article_presenter.social_share_image_url).to eq(nil)
      end
    end

    describe 'has image' do
      let(:article) { build(:article_with_image) }
      subject(:article_presenter) { ArticlePresenter.new(object: article, view_template: view) }

      it 'returns social share image url' do
        expect(article_presenter.social_share_image_url).to eq(root_url[0..-2] + article.social_share_image.show.url)
      end

      it 'show_image should not return nil' do
        expect(article_presenter.show_image(alt: article.title)).to eq(image_tag(article.image.show, alt: article.title))
      end
    end
  end
end
