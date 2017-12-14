class OfficePresenter < BasePresenter
  presents :office

  def linked_text(text = 'View', options = {})
    h.link_to text, h.office_path(office), options
  end

  def address_fields
    city = h.link_to office.office_location_name, office.office_location, class: 'office-location-link' if office.office_location.present?
    [office.building_name, office.address_line_1, office.address_line_2, city, office.postcode].reject(&:blank?)
                                                                   .compact
                                                                   .join(', ')
  end
end
