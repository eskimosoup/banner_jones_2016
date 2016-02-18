class Feature < ActiveRecord::Base
  extend Flip::Declarable

  strategy Flip::CookieStrategy
  strategy Flip::DatabaseStrategy
  strategy Flip::DeclarationStrategy
  default false

  # Note to who ever adds features:
  # Please use this format: <model_name>_<field_name>
  # For features: <model_name>_feature_<feature_name>

  feature :team_member_vcard_download,
    default: false
  feature :team_member_profile,
    default: true,
    description: 'Team member additional profile (not specialisms)'
  feature :team_member_google_plus,
    default: false
  feature :team_member_twitter_link,
    default: false
  feature :team_member_facebook_link,
    default: false
  feature :team_member_mobile_number,
    default: true,
    description: 'Allow team members to have a mobile number'
  feature :team_member_dx_number,
    default: false,
    description: 'Allow team members to have a DX number'
  feature :article_home_page_highlight,
    default: true,
    description: 'Determine if certain articles can be used on the home page'
  feature :article_social_share_features,
    default: true,
    description: 'Add in customisable OpenGraph fields (title, desc., image)'
end
