module Optimadmin
  class TestimonialPresenter < Optimadmin::BasePresenter
    presents :testimonial
    delegate :id, to: :testimonial

    def title
      [testimonial.author_name, testimonial.author_company].reject{|x| x.blank? }.join(', ')
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.raw testimonial.content
    end
  end
end
