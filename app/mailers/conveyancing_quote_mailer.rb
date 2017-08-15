class ConveyancingQuoteMailer < ApplicationMailer
  layout false, only: 'new_quote'

  # ConveyancingQuoteMailer.new_quote(ConveyancingQuotes::User.where(submitted: true).first).deliver_now
  def new_quote(user)
    @user = user

    delivery_options = {
      address: ENV['EMAIL_HOST']
    }

    mail to: @user.email,
         cc: conveyancing_email,
         from: 'info@bannerjones.co.uk',
         subject: "Conveyancing Quote Completed #{site_name}",
         delivery_method_options: delivery_options
  end

  def incomplete_users(users)
    @users = users
    mail to: conveyancing_email,
         subject: "Incomplete Conveyancing Quotes #{site_name}"
  end
end
