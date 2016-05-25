# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w(
  components/home-components.js
  components/service-components.js
  components/shared-components.js
  components/testimonials/slider.js
  components/team-members/slider.js
  components/team-members/index-profile-card.js
  components/module-categories/toggle.js
  components/offices/map.js
  components/resources/hover.js
  optimadmin/*
  vendor/jquery.colorbox.js
  vendor/colorbox.scss
)
