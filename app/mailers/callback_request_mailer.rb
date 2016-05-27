class CallbackRequestMailer < ApplicationMailer
  def new_callback_request(callback_request)
    @callback_request = callback_request
    mail to: (@callback_request.wealth_management.present? ? wealth_management_email : site_email),
         subject: "Callback Request Form Completed #{site_name}"
  end
end
