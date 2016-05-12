class HomeFacade

  def articles
    @articles ||= Article.homepage_highlight
  end

  def banners
    @banners ||= Banner.displayed
  end

  def banner_services
    @banner_services ||= Service.homepage_highlight
  end

  def resources
    @resources ||= Resource.homepage_highlight
  end

  def team_members
    @team_members ||= TeamMember.displayed.limit(8)
  end

  def testimonials
    @testimonials ||= Testimonial.displayed.homepage_highlight.limit(10)
  end
end
