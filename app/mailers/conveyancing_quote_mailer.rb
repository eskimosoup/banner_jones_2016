class ConveyancingQuoteMailer < ApplicationMailer
  # ConveyancingQuoteMailer.new_quote(ConveyancingQuotes::User.first).deliver_now
  layout false, only: 'new_quote'
  def new_quote(user)
    @user = user

    # delivery_options = {
    #   user_name: ENV['EMAIL_USERNAME'],
    #   password: ENV['EMAIL_PASSWORD'],
    #   address: ENV['EMAIL_HOST'],
    #   authentication: :login,
    #   port: 587,
    #   enable_starttls_auto: true
    # }

    mail to: conveyancing_email,
         subject: "Conveyancing Quote Completed #{site_name}" # ,
         # delivery_method_options: delivery_options
  end

  def incomplete_users(users)
    @users = users
    mail to: conveyancing_email,
         subject: "Incomplete Conveyancing Quotes #{site_name}"
  end
end
