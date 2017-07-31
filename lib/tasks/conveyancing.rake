namespace :conveyancing do
  desc 'Send a daily email with incomplete conveyancing submissions'
  task incomplete_submissions_mailer: :environment do
    date = Time.zone.now
    users = ConveyancingQuotes::User.includes(:quote_location)
                                    .where(
                                      created_at: (date.beginning_of_day..date.end_of_day),
                                      submitted: nil
                                    )
                                    .group_by(&:quote_location)
    ConveyancingQuoteMailer.incomplete_users(users).deliver_now
  end
end
