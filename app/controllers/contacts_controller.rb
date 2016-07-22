class ContactsController < ApplicationController
  before_action :load_modules

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    process_contact_request(@contact)
  end

  private

  def process_contact_request(contact)
    if contact.valid?
      ContactMailer.new_contact(@contact).deliver_now
      subscribe_to_mailchimp(contact)
    end
    respond_to do |format|
      format.html { html_contact(contact) }
      format.js { js_contact(contact) }
    end
  end

  def subscribe_to_mailchimp(contact)
    mailchimp_list = Service.find_by(title: contact.service).mailchimp_list if contact.service.present?
    mailchimp_list = MailchimpList.find_by(module_id: nil, module_type: nil) if contact.service.blank? || mailchimp_list.blank?
    Mailchimp.subscribe(mailchimp_list.mailchimp_list_id, contact) if mailchimp_list.present? && mailchimp_list.mailchimp_list_id.present?
  end

  def html_contact(contact)
    if contact.valid?
      redirect_to new_contact_path, notice: 'Thank you for your submission.'
    else
      render :new
    end
  end

  def js_contact(contact)
    flash.notice = 'Thank you for contacting us' if contact.valid?
  end

  def contact_params
    params.require(:contact)
          .permit(:forename, :surname, :telephone, :email,
                  :preferred_contact_method, :preferred_office,
                  :how_heard, :from_url, :mediation,
                  :service, :enquiry_type, :message, :wealth_management)
  end

  def load_modules
    @offices = Office.displayed if Flip.offices?
  end
end
