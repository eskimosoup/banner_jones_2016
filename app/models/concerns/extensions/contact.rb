module Extensions
  module Contact
    extend ActiveSupport::Concern

    included do
      attr_accessor :forename, :surname, :telephone, :email,
                    :preferred_contact_method, :mediation,
                    :preferred_office, :service, :enquiry_type, :message,
                    :how_heard, :wealth_management, :from_url

      validates :forename, :surname,
                :preferred_contact_method,
                :message, presence: true

      validates :email, email: true, presence: true, if: proc { |x| x.preferred_contact_method == 'Email' }
      validates :telephone, telephone: true, presence: true, if: proc { |x| x.preferred_contact_method == 'Phone' }

      # validate :email_or_telephone

      HOW_HEARDS = ['Google search',
                    'Yell.com search',
                    'Other search',
                    'Advertisement',
                    'Facebook advert',
                    'Recommendation',
                    'Existing client',
                    'Mansfield 103 radio',
                    'TV advert'].freeze

      ENQUIRY_TYPES = ['General'].freeze
      CONTACT_METHODS = %w(Phone Email).freeze
    end

    def email_or_telephone
      errors.add(:email, 'or telephone must be provided') if email.blank? && telephone.blank?
    end

    class_methods do
    end
  end
end
