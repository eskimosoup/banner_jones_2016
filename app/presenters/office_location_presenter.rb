class OfficeLocationPresenter < BasePresenter
  presents :office_location

  delegate :name, to: :office_location

end
