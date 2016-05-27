class ApplicationMailer < ActionMailer::Base
  layout 'mailer'
  default to: proc { site_email }
  default from: proc { 'noreply@optimised.today' }

  def site_email
    @site_email = begin
      site_setting = Optimadmin::SiteSetting.where(environment: Rails.env).find_by(key: 'Email')
      if site_setting
        site_setting.value
      else
        'support@optimised.today'
      end
    end
  end

  def wealth_management_email
    @site_email = begin
      site_setting = Optimadmin::SiteSetting.where(environment: Rails.env).find_by(key: 'Email - Wealth Management')
      if site_setting
        site_setting.value
      else
        'support@optimised.today'
      end
    end
  end

  def site_name
    @site_name = begin
      site_setting = Optimadmin::SiteSetting.where(environment: Rails.env).find_by(key: 'Name')
      if site_setting
        site_setting.value
      else
        'Optimised'
      end
    end
  end
end
