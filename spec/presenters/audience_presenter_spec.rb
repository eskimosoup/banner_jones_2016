require 'rails_helper'

RSpec.describe AudiencePresenter, type: :presenter, audience: true do
  let(:audience) { build(:audience_with_departments) }
  subject(:audience_presenter) { AudiencePresenter.new(object: audience, view_template: view) }

  describe 'delegations', :delegation do
    it { should delegate_method(:title).to(:audience) }
  end

  describe 'standard department' do
    it 'returns the department links partial' do
      expect(audience_presenter.render_department_links).to eq(render(partial: 'departments/navigation_link', collection: audience.departments, as: :department))
    end

    it 'returns the department contents partial' do
      expect(audience_presenter.render_department_contents).to eq(render(partial: 'departments/navigation_content', collection: audience.departments, as: :department))
    end
  end
end
