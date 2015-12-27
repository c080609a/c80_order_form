module C80OrderForm
  class MessController < ApplicationController

    def handle_message_order
      puts "<MessController.handle_message_order>"
      m = MessageOrder.new(mess_params)
      respond_to do |format|
        if m.save

          format.js
          MessageOrderMailer.send_mess(m, "Заявка").deliver # TODO_MY:: слово "заявка" поместить в базу, в модель настроек гема
        else
          puts "<MessController.handle_message_order> errors: #{m.errors}"
          format.js { render json: m.errors, status: :unprocessable_entity }
        end
      end
    end

    def mess_params
      params.require(:mess).permit(:name, :email_or_phone, :comment, :kapcha)
    end

  end
end