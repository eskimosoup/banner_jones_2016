require "rails_helper"

feature "User makes a conveyancing purchase quote", type: :feature do
  scenario "Successfully" do
    visit new_conveyancing_quotes_purchase_path

    select "Mr", from: "conveyancing_quotes_purchase_title"
    fill_in "conveyancing_quotes_purchase_forename", with: "Joe"
    fill_in "conveyancing_quotes_purchase_surname", with: "Bloggs"
    fill_in "conveyancing_quotes_purchase_phone", with: "01482 482482"
    fill_in "conveyancing_quotes_purchase_email", with: "joe.bloggs@example.com"
    select "Now", from: "conveyancing_quotes_purchase_timeframe"
    fill_in "conveyancing_quotes_purchase_price", with: 100000
    click_button "Continue"

    within ".conveyancing-quote" do
      expect(page).to have_css ".forename", text: "Joe"
      expect(page).to have_css ".purchase-fee", text: "£425.00"
      expect(page).to have_css ".disbursements .stamp-duty", text: "£0"
    end
  end
end
