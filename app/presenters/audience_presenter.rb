class AudiencePresenter < BasePresenter
  presents :audience
  delegate :title, to: :audience

  def render_department_links
    h.render partial: 'departments/navigation_link',
             collection: audience.departments,
             as: :department
  end

  def render_department_contents
    h.render partial: 'departments/navigation_content',
             collection: audience.departments,
             as: :department
  end
end
