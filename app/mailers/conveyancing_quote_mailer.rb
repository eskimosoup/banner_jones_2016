class ConveyancingQuoteMailer < ApplicationMailer
  # ConveyancingQuoteMailer.new_quote(ConveyancingQuotes::User.first).deliver_now
  def new_quote(user)
    @user = user
    mail to: conveyancing_email,
         subject: "Conveyancing Quote Completed #{site_name}"
  end
end