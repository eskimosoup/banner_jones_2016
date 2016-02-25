module Optimadmin
  class TeamMemberPresenter < Optimadmin::BasePresenter
    presents :team_member
    delegate :id, :forename, :surname, to: :team_member

    def full_name
      [forename, surname].join(' ')
    end

    def reorder_additional_roles
      return if team_member.additional_roles.blank? || team_member.additional_roles.size < 2
      h.content_tag :div do
        h.link_to 'Re-order additional roles',
                  h.team_member_team_member_additional_roles_path(team_member)
      end
    end

    def toggle_title
      inline_detail_toggle_link(full_name)
    end

    def optimadmin_summary
      h.simple_format team_member.specialisms
    end
  end
end
