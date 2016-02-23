class ServiceOffice < ActiveRecord::Base
  belongs_to :service
  belongs_to :office
end
