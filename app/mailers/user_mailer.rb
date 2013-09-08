class UserMailer < ActionMailer::Base

    default from: Ocd::Application.config.support_email

    def activation_email(site)
        @site = site
        @url = @site.code + '.' + Ocd::Application.config.domain
        mail(to: @site.email, subject: @site.code + " Online Collectors Database site activation request")
    end

end
