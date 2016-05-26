require "rails_helper"

describe "viewing pages" do
  scenario "with side nav" do
    content_page = create(:page, title: "Page title")
    page_link = create(:optimadmin_link, menu_resource: content_page)
    menu_item = create(:optimadmin_menu_item, link: page_link, menu_name: "Side menu", name: "My page")

    visit page_path(content_page)

    expect(page).to have_content "Page title"
  end
end
