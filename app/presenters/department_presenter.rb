class DepartmentPresenter < BasePresenter
  presents :department
  delegate :id, :title, to: :department

  def linked_text(text = 'View', options = {})
    h.link_to text,
              h.audience_department_path(department.audience, department),
              options
  end

  def summary
    h.simple_format department.summary
  end

  def render_root_service_links
    h.render partial: 'services/navigation_link',
             collection: department.root_services,
             as: :service
  end
end
