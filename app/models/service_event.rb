class ServiceEvent < ActiveRecord::Base
  belongs_to :service
  belongs_to :event
end
