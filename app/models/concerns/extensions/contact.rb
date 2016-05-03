module Extensions
  module Contact
    extend ActiveSupport::Concern

    included do
      attr_accessor :forename, :surname, :telephone, :email,
                    :preferred_contact_method,
                    :preferred_office, :service, :enquiry_type, :message

      validates :forename, :surname, :telephone, :email,
                :preferred_contact_method, :preferred_office, :service,
                :enquiry_type, :message, presence: true
      validates :email, email: true
      validates :telephone, telephone: true

      validate :email_or_telephone
    end

    def email_or_telephone
      errors.add(:email, 'or telephone must be provided') if email.blank? && telephone.blank?
    end

    class_methods do
    end
  end
end
