require 'rails_helper'
#  rspec --tag 'team_member'
RSpec.describe TeamMemberPresenter, type: :presenter, team_member: true do
  before(:all) do
    Class.new do
      extend Flip::Declarable
      strategy Flip::DeclarationStrategy
      default false
      feature :team_member_vcard_download, default: true
      feature :team_member_google_plus, default: true
      feature :team_member_twitter_link, default: true
      feature :team_member_facebook_link, default: true
      feature :team_member_dx_number, default: true
      feature :team_member_profile, default: true
      feature :team_member_mobile_number, default: true
    end
  end

  let(:team_member) { build(:team_member) }
  subject(:team_member_presenter) { TeamMemberPresenter.new(object: team_member, view_template: view) }

  describe 'delegations', :delegation do
    it { should delegate_method(:forename).to(:team_member) }
    it { should delegate_method(:surname).to(:team_member) }
    # it { should delegate_method(:role).to(:team_member) }
    it { should delegate_method(:primary_telephone).to(:team_member) }
    it { should delegate_method(:secondary_telephone).to(:team_member) }
  end

  describe 'standard team_member' do
    it 'returns the name' do
      expect(team_member_presenter.full_name).to eq([team_member.forename, team_member.surname].join(' '))
    end

    it 'returns office locations' do
      expect(team_member_presenter.office_locations).to eq(team_member.offices.map { |x| x.office_location.name }.join(', '))
    end

    it 'returns the vcard link' do
      if Flip.team_member_vcard_download?
        expect(team_member_presenter.vcard).to eq(link_to 'Download vCard', '#')
      end
    end

    it 'returns the Google Plus link' do
      if Flip.team_member_google_plus?
        expect(team_member_presenter.linked_google_plus('Google+', title: 'Google+', target: '_blank')).to eq(link_to 'Google+', team_member.google_plus, title: 'Google+', target: '_blank')
      end
    end

    it 'returns the Twitter link' do
      if Flip.team_member_twitter_link?
        expect(team_member_presenter.linked_twitter('Follow me on Twitter', title: 'Follow me on Twitter', target: '_blank')).to eq(link_to 'Follow me on Twitter', team_member.twitter_link, title: 'Follow me on Twitter', target: '_blank')
      end
    end

    it 'returns the Facebook link' do
      if Flip.team_member_facebook_link?
        expect(team_member_presenter.linked_facebook('Add me on Facebook', title: 'Add me on Facebook', target: '_blank')).to eq(link_to 'Add me on Facebook', team_member.facebook_link, title: 'Add me on Facebook', target: '_blank')
      end
    end

    it 'returns the html formatted profile' do
      expect(team_member_presenter.profile).to eq(raw team_member.profile)
    end

    it 'returns the html formatted specialisms' do
      expect(team_member_presenter.specialisms).to eq(raw team_member.specialisms)
    end

    it 'returns the role' do
      expect(team_member_presenter.role).to eq(team_member.team_member_role.title)
    end

    it 'returns the mail_to email' do
      expect(team_member_presenter.linked_email_address).to eq(mail_to team_member.email_address)
    end

    it 'returns the dx number' do
      expect(team_member_presenter.dx_number).to eq(team_member.dx_number)
    end

    it 'returns the mobile' do
      expect(team_member_presenter.mobile_number).to eq(team_member.mobile_number)
    end

    it 'returns the additional roles boolean' do
      expect(team_member_presenter.additional_roles?).to eq(false)
    end
  end

  describe 'team member with additional roles' do
    let(:team_member) { build(:team_member_with_additional_roles) }
    subject(:team_member_presenter) { TeamMemberPresenter.new(object: team_member, view_template: view) }

    it 'returns the additional roles boolean' do
      expect(team_member_presenter.additional_roles?).to eq(true)
    end

    it 'returns the additional roles string' do
      expect(team_member_presenter.additional_roles).to eq(team_member.additional_roles.map(&:title).join(', '))
    end
  end

  describe 'images' do
    describe 'no image' do
      it 'show_image should return nil' do
        expect(team_member_presenter.show_image).to eq(nil)
      end
      it 'index_image should return nil' do
        expect(team_member_presenter.index_image).to eq(nil)
      end
    end

    describe 'has image' do
      let(:team_member) { build(:team_member_with_image) }
      subject(:team_member_presenter) { TeamMemberPresenter.new(object: team_member, view_template: view) }

      it 'show_image should not return nil' do
        expect(team_member_presenter.show_image(alt: team_member_presenter.full_name)).to eq(image_tag(team_member.image.show, alt: [team_member.forename, team_member.surname].join(' ')))
      end

      it 'index image should not return nil' do
        expect(team_member_presenter.index_image(alt: team_member_presenter.full_name)).to eq(image_tag(team_member.image.index, alt: [team_member.forename, team_member.surname].join(' ')))
      end
    end
  end
end
