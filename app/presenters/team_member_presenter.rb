class TeamMemberPresenter < BasePresenter
  presents :team_member
  delegate :forename, :surname, :primary_telephone, :secondary_telephone,
           :email_address, to: :team_member

  def full_name
    [forename, surname].join(' ')
  end

  def role
    team_member.team_member_role.title
  end

  def office_locations
    team_member.offices.map { |x| x.office_location.name }.join(', ')
  end

  def additional_roles
    team_member.additional_roles.map(&:title).to_sentence
  end

  def linked_email_address(content = '')
    h.mail_to team_member.email_address, (content.present? ? content : team_member.email_address)
  end

  def specialisms
    h.raw team_member.specialisms
  end

  def linked_google_plus(text = 'Google+', options = {})
    h.link_to text, team_member.google_plus, options if Flip.team_member_google_plus?
  end

  def linked_twitter(text = 'Follow me on Twitter', options = {})
    h.link_to text, team_member.twitter_link, options if Flip.team_member_twitter_link?
  end

  def linked_facebook(text = 'Add me on Facebook', options = {})
    h.link_to text, team_member.facebook_link, options if Flip.team_member_facebook_link?
  end

  def profile
    h.raw team_member.profile if Flip.team_member_profile?
  end

  def vcard
    h.link_to 'Download vCard', '#' if Flip.team_member_vcard_download?
  end

  def mobile_number
    team_member.mobile_number if Flip.team_member_mobile_number?
  end

  def dx_number
    team_member.dx_number if Flip.team_member_dx_number?
  end

  def additional_roles?
    additional_roles.present?
  end
end
