module C80OrderForm
  class MessageOrderMailer < ActionMailer::Base

    default from: Proc.new { SiteProp.first.mail_from },
            to: Proc.new { SiteProp.first.mail_to }

    def send_mess(message, subject)
      @message = format_message(message)

      puts "<MessageOrderMailer.send_mess> Отправляем сообщение."
      mail(subject: subject) do |format|
        format.html { render "mail_mess" }
      end

      #puts "#{SiteProps.first.mail_to}"
    end

    # private

    def format_message(message)
      m = Settings.first.message_text
      m = m.gsub!('{name}',message.name)
      m = m.gsub!('{email_or_phone}',message.email_or_phone)
      m = m.gsub!('{comment}',message.comment)
      m = m.gsub!('{subj_id}',message.subj_id.to_s)
      # puts "<format_message> m: #{m}"
      message.update(:comment => m)
      m
    end

  end
end
