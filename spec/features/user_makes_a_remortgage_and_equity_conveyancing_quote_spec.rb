require "rails_helper"

feature "User makes a remortgage with equity transfer conveyancing quote", type: :feature do
  scenario "successfully" do
    visit new_conveyancing_quotes_remortgage_with_equity_transfer_path

    fill_form(
      title: "Mr",
      forename: "Joe",
      surname: "Bloggs",
      phone: "01482 482 482",
      email: "joe.bloggs@example.com",
      timeframe: "Now",
      remortgage_price: 100000,
      equity_transfer_price: 100000,
    )
    click_button "Continue"

    within ".conveyancing-quote" do
      expect(page).to have_css ".forename", text: "Joe"
      expect(page).to have_css ".remortgage-with-equity-transfer-fee", text: "£495.00"
    end
  end

  scenario "and downloads the pdf" do
    visit new_conveyancing_quotes_remortgage_with_equity_transfer_path

    fill_form(
      title: "Mr",
      forename: "Joe",
      surname: "Bloggs",
      phone: "01482 482 482",
      email: "joe.bloggs@example.com",
      timeframe: "Now",
      remortgage_price: 100000,
      equity_transfer_price: 100000,
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
    "conveyancing_quotes_remortgage_with_equity_transfer_#{ attr }"
  end

end
