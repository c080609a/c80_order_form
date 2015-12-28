module C80OrderForm
  class MessageOrderValidator < ActiveModel::Validator
    def validate(record)
      unless record.errors.present?
        puts "<MessageOrderValidator.validate> record = #{record}"
        mark_please_used = false

        unless record.name.present?
          record.errors[:name] = 'Укажите, пожалуйста, Ваше имя'
          mark_please_used = true
        end

        if record.email_or_phone.present?
          # указан email
          if record.email_or_phone[/([a-z0-9_.-]+)@([a-z0-9-]+)\.[a-z.]+/].present?
          else
            # указан мобильный
            if record.email_or_phone[/^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/].present?
            else
              if mark_please_used
                t2 = 'Номер телефона или email введены неверно'
              else
                t2 = 'Пожалуйста, укажите корректный номер телефона или email'
                mark_please_used = true
              end
              record.errors[:email_or_phone] = t2
            end
          end
        else
          if mark_please_used
            t1 = 'Укажите или номер телефона или email'
          else
            t1 = 'Укажите, пожалуйста, или номер телефона или email'
            mark_please_used = true
          end
          record.errors[:email_or_phone] = t1
        end

        unless record.comment.present?
          record.errors[:comment] = 'Сообщение не может быть пустым'
        end

        unless record.kapcha.blank?
          record.errors[:kapcha] = 'fail'
        end
      end

    end
  end
end