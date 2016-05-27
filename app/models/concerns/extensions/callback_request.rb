module Extensions
  module CallbackRequest
    extend ActiveSupport::Concern

    included do
      attr_accessor :forename, :surname, :email_address, :contact_telephone,
                    :callback_time, :preferred_office, :service, :enquiry_type,
                    :how_heard, :wealth_management

      validates :forename, :surname, :contact_telephone,
                :callback_time, :enquiry_type, presence: true
    end

    class_methods do
    end
  end
end
