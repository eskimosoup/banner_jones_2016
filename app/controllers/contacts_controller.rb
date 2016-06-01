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
    ContactMailer.new_contact(@contact).deliver_now if contact.valid?
    respond_to do |format|
      format.html { html_contact(contact) }
      format.js { js_contact(contact) }
    end
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
                  :how_heard, :from_url,
                  :service, :enquiry_type, :message, :wealth_management)
  end

  def load_modules
    @offices = Office.displayed if Flip.offices?
  end
end
