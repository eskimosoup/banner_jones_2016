class ContactMailer < ApplicationMailer
  def new_contact(contact)
    @contact = contact
    mail to: (@contact.wealth_management.present? ? wealth_management_email : site_email),
         subject: "Contact Form Completed #{site_name}"
  end
end
