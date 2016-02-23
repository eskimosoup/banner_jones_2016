class ServiceArticle < ActiveRecord::Base
  belongs_to :service
  belongs_to :article
end
