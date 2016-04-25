module Optimadmin
  class BlogPostsController < Optimadmin::ApplicationController
    before_action :set_blog_post, only: [:show, :edit, :update, :destroy]

    edit_images_for BlogPost,
                    [
                      [:image, { show: ['fit', 200, 200], index: ['fill', 200, 200] }],
                      [:social_share_image, { show: ['fit', 1200, 600] }]
                    ]

    def index
      @blog_posts = Optimadmin::BaseCollectionPresenter.new(collection: BlogPost.where('title ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::BlogPostPresenter)
    end

    def show
    end

    def new
      @blog_post = BlogPost.new
    end

    def edit
    end

    def create
      @blog_post = BlogPost.new(blog_post_params)
      if @blog_post.save
        redirect_to_index_or_continue_editing(@blog_post)
      else
        render :new
      end
    end

    def update
      if @blog_post.update(blog_post_params)
        redirect_to_index_or_continue_editing(@blog_post)
      else
        render :edit
      end
    end

    def destroy
      @blog_post.destroy
      redirect_to blog_posts_url, notice: 'Blog post was successfully destroyed.'
    end

    private

    def set_blog_post
      @blog_post = BlogPost.find(params[:id])
    end

    def blog_post_params
      params.require(:blog_post).permit(:title, :summary, :content, :date,
                                        :remote_image_url, :remove_image,
                                        :image_cache,
                                        :remote_social_share_image_url,
                                        :remove_social_share_image,
                                        :social_share_image_cache,
                                        :image, :social_share_title,
                                        :social_share_description,
                                        :social_share_image, :blog_category_id,
                                        :team_member_id,
                                        :suggested_url, :display)
    end
  end
end
