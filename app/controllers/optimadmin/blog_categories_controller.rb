module Optimadmin
  class BlogCategoriesController < Optimadmin::ApplicationController
    before_action :set_blog_category, only: [:show, :edit, :update, :destroy]

    def index
      @blog_categories = Optimadmin::BaseCollectionPresenter.new(collection: BlogCategory.where('title ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::BlogCategoryPresenter)
    end

    def show
    end

    def new
      @blog_category = BlogCategory.new
    end

    def edit
    end

    def create
      @blog_category = BlogCategory.new(blog_category_params)
      if @blog_category.save
        redirect_to_index_or_continue_editing(@blog_category)
      else
        render :new
      end
    end

    def update
      if @blog_category.update(blog_category_params)
        redirect_to_index_or_continue_editing(@blog_category)
      else
        render :edit
      end
    end

    def destroy
      @blog_category.destroy
      redirect_to blog_categories_url, notice: 'Blog category was successfully destroyed.'
    end

    private

    def set_blog_category
      @blog_category = BlogCategory.find(params[:id])
    end

    def blog_category_params
      params.require(:blog_category).permit(:title, :suggested_url, :display)
    end
  end
end
