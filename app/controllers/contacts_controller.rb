class ContactsController < ApplicationController
  before_action :load_modules

  def new
    @contact = Contact.new
    @office = Office.displayed.find(params[:office_id]) if params[:office_id].present?
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      ContactMailer.new_contact(@contact).deliver_now
      redirect_to new_contact_path, notice: 'Thank you for your submission.'
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact)
          .permit(:forename, :surname, :telephone, :email, :preferred_contact_method, :preferred_office, :service, :enquiry_type, :message)
  end

  def load_modules
    @offices = Office.displayed if Flip.offices?
  end
end
