require "rails_helper"

feature "User makes a transfer of equity conveyancing quote", type: :feature do
  scenario "successfully" do
    visit new_conveyancing_quotes_equity_transfer_path

    select "Mr", from: "conveyancing_quotes_equity_transfer_title"
    fill_in "conveyancing_quotes_equity_transfer_forename", with: "Joe"
    fill_in "conveyancing_quotes_equity_transfer_surname", with: "Bloggs"
    fill_in "conveyancing_quotes_equity_transfer_phone", with: "01482 482482"
    fill_in "conveyancing_quotes_equity_transfer_email", with: "joe.bloggs@example.com"
    select "Now", from: "conveyancing_quotes_equity_transfer_timeframe"
    fill_in "conveyancing_quotes_equity_transfer_price", with: 100000
    click_button "Continue"

    within ".conveyancing-quote" do
      expect(page).to have_css ".forename", text: "Joe"
      expect(page).to have_css ".equity-transfer-fee", text: "£395.00"
    end
  end
end
