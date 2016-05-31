require "rails_helper"

describe "user creates a payment instance", type: :feature do
  scenario "successfullly" do
    visit new_payment_path

    fill_payment_form(
      invoice_number: "XP1000",
      name: "John F Tompkins",
      contact_number: "01234 567890",
      amount: 15.90
    )
    click_button "Continue"
    
    expect(page).to have_css ".payment .invoice_number", text: "XP1000"
    expect(page).to have_css ".payment .name", text: "John F Tompkins"
    expect(page).to have_css ".payment .contact_number", text: "01234 567890"
    expect(page).to have_css ".payment .amount", text: "15.90"
  end

  def fill_payment_form(attrs = {})
    attrs.each do |attr, value|
      fill_in "payment_#{ attr }", with: value
    end
  end
end
