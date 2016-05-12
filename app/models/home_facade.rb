class HomeFacade
  def banners
    @banners ||= Banner.displayed
  end

  def testimonials
    @testimonials ||= Testimonial.displayed.homepage_highlight.limit(10)
  end

  def resources
    @resources ||= Resource.homepage_highlight
  end

  def articles
    @articles ||= Article.homepage_highlight
  end

  def team_members
    @team_members ||= TeamMember.displayed.limit(8)
  end

  def offices
    @offices ||= Office.displayed
  end

  def services
    @services ||= Service.root_services.displayed.pluck(:title, :id)
  end

  def banner_services
    @banner_services ||= Service.homepage_highlight
  end
end
