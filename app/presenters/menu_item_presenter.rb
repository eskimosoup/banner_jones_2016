class MenuItemPresenter < BasePresenter
  presents :menu_item
  attr_reader :link, :menu_resource

  def initialize(object:, view_template:, descendants_hash: nil)
    super(object: object, view_template: view_template)
    @link = menu_item.link
    @menu_resource = @link.menu_resource
    @descendants_hash = descendants_hash
  end

  def display_offices?
    team_member_route? || contact_route?
  end

  def link_to_webpage(options = {})
    return nil if destination.nil?
    h.link_to name, destination, options.merge({title: title_attribute, class: classes})
  end

  def special_layout
    if destination.class.present? && destination.class.name == 'Audience' && menu_item.menu_name == 'primary_header'
      h.render 'menu_items/meganav', audience: destination
    end
    #elsif destination.present? && menu_item.menu_name == 'primary_header' && menu_item.link.menu_resource_type == 'Optimadmin::ModulePage' && menu_item.link.menu_resource.route == 'new_contact_path'
    #  h.render partial: 'menu_items/offices',
    #         locals: { menu_item_presenter: MenuItemPresenter.new(object: menu_item, view_template: self, descendants_hash: menu_item.children),
    #                   sub_menu_items: menu_item.children, depth: 1 }
    #end
  end

  def offices_dropdown?
    destination.present? && menu_item.menu_name == 'primary_header' && menu_item.link.menu_resource_type == 'Optimadmin::ModulePage' && menu_item.link.menu_resource.route == 'new_contact_path'
  end

  def classes
    classes = ["menu-link"]
    classes << "active" if active?
    classes.join(' ')
  end

  def menu_name
    "#{menu_item.menu_name.tr('_', '-')}-dropdown"
  end

  def sub_menu_items
    @descendants_hash
  end

  def has_children?
    sub_menu_items.present? || display_offices?
  end

  def destination
    destination_evaluator.destination
  end

  def active?
    destination_evaluator.active? || active_descendants?
  end

  private


  def descendants_array
    @desendants_array ||= build_descendants_array
  end

  def build_descendants_array
    return [] if sub_menu_items.blank?
    flatten_nested_hash(sub_menu_items)
  end

  def flatten_nested_hash(menu_items)
    # flat maps flattens by one level, call recursively packaging the values into one item of an array by the splat operator
    menu_items.flat_map{|k, v| [k, *flatten_nested_hash(v)] }
  end

  def descendants_destinations
    descendants_array.map{|x| MenuItemDestinationEvaluator.new(view_template: h, menu_resource: x.link.menu_resource) }
  end

  def active_descendants?
    descendants_destinations.map(&:active?).any?{|x| x == true }
  end

  def name
    menu_item.name
  end

  def title_attribute
    menu_item.title_attribute
  end

  def destination_evaluator
    @destination_evaluator ||= MenuItemDestinationEvaluator.new(view_template: h, menu_resource: menu_resource)
  end

  def team_member_route?
    static_route? && menu_resource.route == "team_members_path"
  end

  def contact_route?
    static_route? && menu_resource.route == "new_contact_path"
  end

  def static_route?
    menu_resource.class == Optimadmin::ModulePage
  end
end
