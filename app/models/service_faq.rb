class ServiceFaq < ActiveRecord::Base
  belongs_to :service
  belongs_to :frequently_asked_question
end
