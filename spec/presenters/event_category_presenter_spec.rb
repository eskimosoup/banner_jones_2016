require 'rails_helper'

RSpec.describe EventCategoryPresenter, type: :presenter, event_category: true do
  let(:event_category) { build(:event_category) }
  subject(:event_category_presenter) { EventCategoryPresenter.new(object: event_category, view_template: view) }

  pending "add some examples to (or delete) #{__FILE__}"
end
