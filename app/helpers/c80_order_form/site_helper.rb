module C80OrderForm
  module SiteHelper

    def render_order_form(predefined_comment="",subj_id=-1)

      render :partial => "c80_order_form/site/shared/order_form",
             :locals => {
                 :mess => "MessageOrder.new",
                 :predefined_comment => predefined_comment,
                 :subj_id => subj_id
             }

    end

    def render_ok_message
      render :partial => "c80_order_form/site/shared/ok_message",
             :locals => {
                 ok_text: "Мы свяжемся с Вами в ближайшее время.", # TODO_MY:: текст "мы свяжемся с вами ..." перенести в базу, в модель настроек гема
                 wtitle: "Ваша заявка отправлена" # TODO_MY:: текст "ваше сообщение отправлено" перенести в базу, в модель настроек гема
             }
    end

  end
end