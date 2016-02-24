class ServiceVideo < ActiveRecord::Base
  belongs_to :service
  belongs_to :video
end
