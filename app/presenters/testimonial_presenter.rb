class TestimonialPresenter < BasePresenter
  presents :testimonial
  delegate :author_name, :author_company, to: :testimonial

  def author
    [author_name, author_company].reject{|x| x.blank? }.join(', ')
  end

  def content
    h.raw testimonial.content
  end
end
