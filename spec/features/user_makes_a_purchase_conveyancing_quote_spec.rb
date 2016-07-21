require "rails_helper"

feature "User makes a conveyancing purchase quote", type: :feature do
  scenario "Successfully" do
    visit new_conveyancing_quotes_purchase_path
    fill_form(
      title: "Mr",
      forename: "Joe",
      surname: "Bloggs",
      phone: "01482 482 482",
      email: "joe.bloggs@example.com",
      timeframe: "Now",
      price: 100000,
    )
    click_button "Continue"

    within ".conveyancing-quote" do
      expect(page).to have_css ".forename", text: "Joe"
      expect(page).to have_css ".purchase-fee", text: "£450.00"
      expect(page).to have_css ".disbursements .stamp-duty", text: "£0"
    end
  end

  scenario "and downloads the pdf" do
    visit new_conveyancing_quotes_purchase_path
    fill_form(
      title: "Mr",
      forename: "Joe",
      surname: "Bloggs",
      phone: "01482 482 482",
      email: "joe.bloggs@example.com",
      timeframe: "Now",
      price: 100000,
    )
    click_button "Continue"
    click_link I18n.t("conveyancing_quotes.download_button")

    expect(content_type).to eq("application/pdf")
    expect(content_disposition).to include("inline")
    expect(download_filename).to include("Banner Jones Conveyancing Quote")
    expect(pdf_body).to have_content("Joe")
  end

  def fill_form(attrs = {})
    attrs.each do |attr, value|
      case attr
      when :title, :timeframe
        select value, from: field_name(attr)
      else
        fill_in field_name(attr), with: value
      end
    end
  end

  def field_name(attr)
    "conveyancing_quotes_purchase_#{ attr }"
  end
end
