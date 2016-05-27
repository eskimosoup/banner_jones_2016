module Extensions
  module Contact
    extend ActiveSupport::Concern

    included do
      attr_accessor :forename, :surname, :telephone, :email,
                    :preferred_contact_method,
                    :preferred_office, :service, :enquiry_type, :message,
                    :find_us, :wealth_management

      validates :forename, :surname,
                :preferred_contact_method,
                :enquiry_type, :message, presence: true

      validates :email, email: true, presence: true, if: proc { |x| x.preferred_contact_method == 'Email' }
      validates :telephone, telephone: true, presence: true, if: proc { |x| x.preferred_contact_method == 'Phone' }

      # validate :email_or_telephone
    end

    def email_or_telephone
      errors.add(:email, 'or telephone must be provided') if email.blank? && telephone.blank?
    end

    class_methods do
    end
  end
end
