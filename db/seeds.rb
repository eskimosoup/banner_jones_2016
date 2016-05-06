Optimadmin::Administrator.create!([
  {username: "optimised", email: "support@optimised.today", role: "master", auth_token: "ZhCrKpDsIz6N-wPyZGedAQ", password_digest: "$2a$10$JJwNl7438b7jqBMnWsQH0OnOJBVetp/uVqrqh4Mh9haInB3IDq5lC", password_reset_token: nil, password_reset_sent_at: nil}
])
Optimadmin::SiteSetting.create!([
  {key: "Email", value: "support@optimised.today", environment: "development"},
  {key: "Meta Description", value: "optimadmin meta description", environment: "development"},
  {key: "Name", value: "Banner Jones", environment: "development"},
  {key: "Name", value: "Banner Jones", environment: "production"},
  {key: "Facebook URL", value: "#", environment: "production"},
  {key: "Google Plus URL", value: "#", environment: "production"},
  {key: "LinkedIn URL", value: "#", environment: "production"},
  {key: "Twitter URL", value: "#", environment: "production"},
  {key: "YouTube URL", value: "#", environment: "production"},
  {key: "Phone", value: "0330 017 6302", environment: "production"},
  {key: "Email", value: "support@optimised.today", environment: "production"},
  {key: "Facebook URL", value: "#", environment: "development"},
  {key: "Google Plus URL", value: "#", environment: "development"},
  {key: "LinkedIn URL", value: "#", environment: "development"},
  {key: "Phone", value: "0330 017 6302", environment: "development"},
  {key: "Twitter URL", value: "#", environment: "development"},
  {key: "YouTube URL", value: "#", environment: "development"}
])
