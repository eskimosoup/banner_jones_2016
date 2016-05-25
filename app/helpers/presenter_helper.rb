module PresenterHelper
  def present(object)
    return if object.nil? || object.class.presenter.blank?
    presenter = object.class.presenter.new(object: object, view_template: self)
    yield presenter if block_given?
    presenter
  end

  def nested_menu_items(menu_items:, view_partial: 'menu_items/menu_item', depth: 1)
    office_data = Office.joins(:office_location).select("offices.id, office_locations.name AS name").reorder("office_locations.name asc")
    menu_items.map do |menu_item, sub_menu_items|
      render(
        partial: view_partial,
        locals: { 
          menu_item_presenter: MenuItemPresenter.new(object: menu_item, view_template: self, descendants_hash: sub_menu_items),
          depth: depth,
          office_data: office_data
        }
      )
    end.join.html_safe
  end

  def child_menu_items(menu_items:)
    menu_items.map do |menu_item|
      render partial: "menu_items/child_menu_item",
             locals: { menu_item_presenter: menu_item, depth: 0 }
   end.join.html_safe
  end
end
