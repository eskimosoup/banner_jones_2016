require "rails_helper"

describe Optimadmin::BlogCategoriesController, type: :controller, blog_category: true do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe "#create" do
    context "when Blog category is valid" do
      it "redirects to index on normal save" do
        blog_category = stub_valid_blog_category

        post :create, commit: "Save", blog_category: blog_category.attributes

        expect(response).to redirect_to(blog_categories_path)
        expect(flash[:notice]).to eq("Blog category was successfully created.")
      end

      it "redirects to edit on save and continue editing" do
        blog_category = stub_valid_blog_category

        post :create, commit: "Save and continue editing", blog_category: blog_category.attributes

        expect(response).to redirect_to(edit_blog_category_path(blog_category))
        expect(flash[:notice]).to eq("Blog category was successfully created.")
      end
    end

    context "when Blog category is invalid" do
      it "renders the edit template" do
        blog_category = stub_invalid_blog_category

        post :create, commit: "Save", blog_category: blog_category.attributes

        expect(response).to render_template(:new)
      end
    end
  end

  describe "#update" do
    context "when Blog category is valid" do
      it "redirects to index on normal save" do
        blog_category = stub_valid_blog_category

        patch :update, id: blog_category.id, commit: "Save", blog_category: blog_category.attributes

        expect(response).to redirect_to(blog_categories_path)
        expect(flash[:notice]).to eq("Blog category was successfully updated.")
      end

      it "redirects to edit on save and continue editing" do
        blog_category = stub_valid_blog_category

        patch :update, id: blog_category.id, commit: "Save and continue editing", blog_category: blog_category.attributes

        expect(response).to redirect_to(edit_blog_category_path(blog_category))
        expect(flash[:notice]).to eq("Blog category was successfully updated.")
      end
    end

    context "when Blog category is invalid" do
      it "renders the edit template" do
        blog_category = stub_invalid_blog_category

        patch :update, id: blog_category.id, commit: "Save", blog_category: blog_category.attributes

        expect(response).to render_template(:edit)
      end
    end
  end

  def stub_valid_blog_category
    blog_category = build_stubbed(:blog_category)
    allow(BlogCategory).to receive(:new).and_return(blog_category)
    allow(blog_category).to receive(:save).and_return(true)
    allow(BlogCategory).to receive(:find).and_return(blog_category)
    allow(blog_category).to receive(:update).and_return(true)
    blog_category
  end

  def stub_invalid_blog_category
    blog_category = build_stubbed(:blog_category)
    allow(BlogCategory).to receive(:new).and_return(blog_category)
    allow(blog_category).to receive(:save).and_return(false)
    allow(BlogCategory).to receive(:find).and_return(blog_category)
    allow(blog_category).to receive(:update).and_return(false)
    blog_category
  end
end
