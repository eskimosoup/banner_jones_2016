class ContactMailer < ApplicationMailer
  def new_contact(contact)
    @contact = contact
    email_to = @contact.wealth_management.present? ? wealth_management_email : @contact.mediation.present? ? mediation_email : site_email
    mail to: email_to,
         subject: "Contact Form Completed #{site_name}"
  end
end
