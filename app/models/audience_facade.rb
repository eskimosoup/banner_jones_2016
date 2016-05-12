class AudienceFacade
  attr_reader :audience

  def initialize(audience_id)
    @audience = Audience.find(audience_id)
  end

  def articles
    @articles ||= audience.articles.displayed
  end

  def banners
  end

  def banner_services
    @banner_services ||= audience.services.displayed
  end

  def resources
    @resources ||= audience.resources.displayed
  end

  def team_members
    @team_members ||= TeamMember.joins(:service_team_members).where(services_team_members: { service_id: audience.service_ids }).displayed.distinct.limit(8)
  end

  def testimonials
    @testimonials ||= audience.testimonials.displayed.limit(10)
  end
end
