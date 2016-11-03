module C80OrderForm
  class MessageOrderMailer < ActionMailer::Base

    default from: Proc.new { SiteProp.first.mail_from },
            to: Proc.new { SiteProp.first.mail_to }

    def send_mess(message, subject)
      Rails.logger.debug "<send_message> #{message.as_json}"
      @message = format_message(message)

      puts "<MessageOrderMailer.send_mess> Отправляем сообщение."
      mail(subject: subject) do |format|
        format.html { render "mail_mess" }
      end

      #puts "#{SiteProps.first.mail_to}"
    end

    # private

    def format_message(message)
      
      tmp = Settings.first.message_text
      if tmp.present?
        m = tmp
      end
      Rails.logger.debug "<format_message> m: #{m}"
      
      tmp = m.gsub!('{name}',message.name)
      if tmp.present?
        m = tmp
      end
      Rails.logger.debug "<format_message> m: #{m}"

      tmp = m.gsub!('{email_or_phone}',message.email_or_phone)
      if tmp.present?
        m = tmp
      end
      Rails.logger.debug "<format_message> m: #{m}"

      tmp = m.gsub!('{comment}',message.comment)
      if tmp.present?
        m = tmp
      end
      Rails.logger.debug "<format_message> m: #{m}"

      tmp = m.gsub!('{subj_id}',message.subj_id.to_s)
      if tmp.present?
        m = tmp
      end
      Rails.logger.debug "<format_message> m: #{m}"

      message.update(:comment => m)
      m
    end

  end
end
