class AddStartedToConveyancingQuotesUser < ActiveRecord::Migration[5.0]
  def change
    add_column :conveyancing_quotes_users, :started, :boolean
    ConveyancingQuotes::User.all.each do |user|
      user.update_attributes(started: user.price?)
    end
  end
end
