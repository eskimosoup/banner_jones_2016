require 'rails_helper'

RSpec.describe AudiencePresenter, type: :presenter, audience: true do
  let(:audience) { build(:audience) }
  subject(:audience_presenter) { AudiencePresenter.new(object: audience, view_template: view) }
end
