module ConveyancingQuotes
  class SaleAndPurchase < ApplicationRecord
    belongs_to :user,
               foreign_key: 'conveyancing_quotes_user_id'

    has_one :sale,
            dependent: :destroy,
            foreign_key: 'conveyancing_quotes_sale_and_purchases_id'

    has_one :purchase,
            dependent: :destroy,
            foreign_key: 'conveyancing_quotes_sale_and_purchases_id'

    after_create :set_user_sale_and_purchase

    accepts_nested_attributes_for :sale,
                                  reject_if: :all_blank,
                                  allow_destroy: true

    accepts_nested_attributes_for :purchase,
                                  reject_if: :all_blank,
                                  allow_destroy: true

    def set_user_sale_and_purchase
      user.sale = sale
      user.purchase = purchase
      user.save!
    end
  end
end
