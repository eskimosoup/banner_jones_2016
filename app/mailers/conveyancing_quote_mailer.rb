class ConveyancingQuoteMailer < ApplicationMailer
  layout 'inky', except: 'incomplete_users'

  # ConveyancingQuoteMailer.new_quote(ConveyancingQuotes::User.where(submitted: true).first).deliver_now
  def new_quote(user)
    @user = user
    @global_site_settings = Optimadmin::SiteSetting.current_environment
    @configuration = user.configuration

    delivery_options = {
      address: ENV['BANNER_JONES_EMAIL_HOST']
    }

    mail to: @user.email,
         from: 'info@bannerjones.co.uk',
         subject: "Conveyancing Quote Completed #{site_name}",
         delivery_method_options: delivery_options
  end

  # ConveyancingQuoteMailer.new_quote_notification(ConveyancingQuotes::User.where(submitted: true).first).deliver_now
  def new_quote_notification(user)
    @user = user
    @global_site_settings = Optimadmin::SiteSetting.current_environment
    @confirmation = true
    @configuration = user.configuration

    mail to: conveyancing_email,
         subject: "Conveyancing Quote Completed #{site_name}" do |format|
      format.html { render 'conveyancing_quote_mailer/new_quote' }
    end
  end

  def new_callback_request(callback_request)
    @callback_request = callback_request

    mail to: conveyancing_email,
         cc: site_email,
         subject: "Conveyancing Callback Request #{site_name}"
  end

  # def incomplete_users(users)
  #  @users = users
  #  mail to: conveyancing_email,
  #       subject: "Incomplete Conveyancing Quotes #{site_name}"
  # end
end
