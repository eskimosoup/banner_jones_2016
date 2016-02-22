class DepartmentPresenter < BasePresenter
  presents :department
  delegate :title, to: :department

  def linked_text(text = 'View', options = {})
    h.link_to text, h.department_path(department), options
  end

  def summary
    h.simple_format department.summary
  end
end
