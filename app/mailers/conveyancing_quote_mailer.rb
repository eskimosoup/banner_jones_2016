class ConveyancingQuoteMailer < ApplicationMailer
  # ConveyancingQuoteMailer.new_quote(ConveyancingQuotes::User.first).deliver_now
  layout false, only: 'new_quote'
  def new_quote(user)
    @user = user

     delivery_options = {
       address: ENV['EMAIL_HOST']
     }

    mail # to: conveyancing_email,
         to: 'paul@optimisd.today',
         from: 'info@bannerjones.co.uk',
         subject: "Conveyancing Quote Completed #{site_name}" # ,
         delivery_method_options: delivery_options
  end

  def incomplete_users(users)
    @users = users
    mail to: conveyancing_email,
         subject: "Incomplete Conveyancing Quotes #{site_name}"
  end
end
