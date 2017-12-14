class OfficeLocationFacade
  attr_reader :office_location

  delegate :name, :title, :content, :image, to: :office_location

  def initialize(office_location)
    @office_location = office_location
  end

  def services
    @services ||= office_location.services.displayed
  end

  def team_members
    @team_members ||= office_location.team_members.displayed.limit(48)
  end

  def testimonials
    @testimonials ||= office_location.testimonials.displayed.limit(8)
  end

  def resources
    @resources ||= office_location.resources.displayed.limit(8)
  end

  def articles
    @articles ||= office_location.articles.displayed.limit(5)
  end

  def offices
    @offices ||= office_location.offices.displayed
  end
end
