require 'rails_helper'

RSpec.describe EventLocationPresenter, type: :presenter, event_location: true do
  let(:event_location) { build(:event_location) }
  subject(:event_location_presenter) { EventLocationPresenter.new(object: event_location, view_template: view) }

  pending "add some examples to (or delete) #{__FILE__}"
end
