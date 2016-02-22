module Optimadmin
  class AudiencePresenter < Optimadmin::BasePresenter
    presents :audience
    delegate :id, :title, to: :audience

    def departments
      h.link_to h.departments_path(audience_id: audience.id) do
        h.pluralize(audience.departments_count, 'department')
      end
    end
  end
end
