module Optimadmin
  class TeamMemberPresenter < Optimadmin::BasePresenter
    presents :team_member
    delegate :id, :forename, :surname, to: :team_member

    def full_name
      [forename, surname].join(' ')
    end

    def toggle_title
      inline_detail_toggle_link(full_name)
    end

    def optimadmin_summary
      h.simple_format team_member.specialisms
    end
  end
end
