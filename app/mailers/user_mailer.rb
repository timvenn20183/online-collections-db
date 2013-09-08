class UserMailer < ActionMailer::Base

    default from: Ocd::Application.config.support_email

    def activation_email(site)
        @site = site
        @url = @site.code + '.' + Ocd::Application.config.domain
        mail(to: @site.email, subject: @site.code + " Online Collectors Database site activation request")
    end

    def send_user_comment(comment)
        @comment = comment
        if @comment.site.comms_options[:email_comments] == true then
            begin
                mail(to: @comment.site.email, subject: @comment.site.code + "." + Ocd::Application.config.domain + " - " + @comment.subject)
                @comment.send_date = Time.now
                @comment.save
            rescue
                return false
            end
        end
    end

end
