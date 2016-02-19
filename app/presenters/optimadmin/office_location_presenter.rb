module Optimadmin
  class OfficeLocationPresenter < Optimadmin::BasePresenter
    presents :office_location
    delegate :name, :id, to: :office_location
  end
end
