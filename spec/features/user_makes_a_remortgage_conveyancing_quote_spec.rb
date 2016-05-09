require "rails_helper"

feature "User makes a remortgage conveyancing quote", type: :feature do
  scenario "successfully" do
    visit new_conveyancing_quotes_remortgage_path

    select "Mr", from: "conveyancing_quotes_remortgage_title"
    fill_in "conveyancing_quotes_remortgage_forename", with: "Joe"
    fill_in "conveyancing_quotes_remortgage_surname", with: "Bloggs"
    fill_in "conveyancing_quotes_remortgage_phone", with: "01482 482482"
    fill_in "conveyancing_quotes_remortgage_email", with: "joe.bloggs@example.com"
    select "Now", from: "conveyancing_quotes_remortgage_timeframe"
    fill_in "conveyancing_quotes_remortgage_price", with: 100000
    click_button "Continue"

    within ".conveyancing-quote" do
      expect(page).to have_css ".forename", text: "Joe"
      expect(page).to have_css ".remortgage-fee", text: "£395.00"
    end
  end
end
