module C80OrderForm
  module SiteHelper

    def render_order_form

      render :partial => "c80_order_form/site/shared/order_form",
             :locals => {
                 :mess => "MessageOrder.new"
             }

    end

    def render_ok_message
      render :partial => "c80_order_form/site/shared/ok_message",
             :locals => {
                 ok_text: "Мы свяжемся с Вами в ближайшее время.", # TODO_MY:: текст "мы свяжемся с вами ..." перенести в базу, в модель настроек гема
                 wtitle: "Ваше сообщение отправлено" # TODO_MY:: текст "ваше сообщение отправлено" перенести в базу, в модель настроек гема
             }
    end

  end
end