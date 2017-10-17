class ConveyancingQuoteMailerPreview < ActionMailer::Preview
  def new_quote
    ConveyancingQuoteMailer.new_quote(ConveyancingQuotes::User.where(submitted: true).last)
  end

  def new_quote_notification
    ConveyancingQuoteMailer.new_quote_notification(ConveyancingQuotes::User.where(submitted: true).last)
  end
end
