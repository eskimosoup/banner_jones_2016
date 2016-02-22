class DepartmentPresenter < BasePresenter
  presents :department
  delegate :title, to: :department
end
