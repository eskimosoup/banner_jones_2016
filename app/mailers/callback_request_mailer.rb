class CallbackRequestMailer < ApplicationMailer
  def new_callback_request(callback_request)
    @callback_request = callback_request
    email_to = @callback_request.wealth_management.present? ? wealth_management_email : @callback_request.mediation.present? ? mediation_email : site_email
    mail to: email_to,
         subject: "Callback Request Form Completed #{site_name}"
  end
end
