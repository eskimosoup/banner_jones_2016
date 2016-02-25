require "rails_helper"

describe Optimadmin::BlogPostsController, type: :controller, blog_post: true do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe "#create" do
    context "when Blog post is valid" do
      it "redirects to index on normal save" do
        blog_post = stub_valid_blog_post

        post :create, commit: "Save", blog_post: blog_post.attributes

        expect(response).to redirect_to(blog_posts_path)
        expect(flash[:notice]).to eq("Blog post was successfully created.")
      end

      it "redirects to edit on save and continue editing" do
        blog_post = stub_valid_blog_post

        post :create, commit: "Save and continue editing", blog_post: blog_post.attributes

        expect(response).to redirect_to(edit_blog_post_path(blog_post))
        expect(flash[:notice]).to eq("Blog post was successfully created.")
      end
    end

    context "when Blog post is invalid" do
      it "renders the edit template" do
        blog_post = stub_invalid_blog_post

        post :create, commit: "Save", blog_post: blog_post.attributes

        expect(response).to render_template(:new)
      end
    end
  end

  describe "#update" do
    context "when Blog post is valid" do
      it "redirects to index on normal save" do
        blog_post = stub_valid_blog_post

        patch :update, id: blog_post.id, commit: "Save", blog_post: blog_post.attributes

        expect(response).to redirect_to(blog_posts_path)
        expect(flash[:notice]).to eq("Blog post was successfully updated.")
      end

      it "redirects to edit on save and continue editing" do
        blog_post = stub_valid_blog_post

        patch :update, id: blog_post.id, commit: "Save and continue editing", blog_post: blog_post.attributes

        expect(response).to redirect_to(edit_blog_post_path(blog_post))
        expect(flash[:notice]).to eq("Blog post was successfully updated.")
      end
    end

    context "when Blog post is invalid" do
      it "renders the edit template" do
        blog_post = stub_invalid_blog_post

        patch :update, id: blog_post.id, commit: "Save", blog_post: blog_post.attributes

        expect(response).to render_template(:edit)
      end
    end
  end

  def stub_valid_blog_post
    blog_post = build_stubbed(:blog_post)
    allow(BlogPost).to receive(:new).and_return(blog_post)
    allow(blog_post).to receive(:save).and_return(true)
    allow(BlogPost).to receive(:find).and_return(blog_post)
    allow(blog_post).to receive(:update).and_return(true)
    blog_post
  end

  def stub_invalid_blog_post
    blog_post = build_stubbed(:blog_post)
    allow(BlogPost).to receive(:new).and_return(blog_post)
    allow(blog_post).to receive(:save).and_return(false)
    allow(BlogPost).to receive(:find).and_return(blog_post)
    allow(blog_post).to receive(:update).and_return(false)
    blog_post
  end
end
