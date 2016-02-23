require 'rails_helper'

RSpec.describe EventPresenter, type: :presenter, event: true do
  let(:event) { build(:event) }
  subject(:event_presenter) { EventPresenter.new(object: event, view_template: view) }

  pending "add some examples to (or delete) #{__FILE__}"
end
