module C80OrderForm
  class MessController < ApplicationController

    def handle_message_order
      # puts "<MessController.handle_message_order>"
      m = MessageOrder.new(mess_params)
      respond_to do |format|
        if m.save

          format.js
          settings = Settings.first
          MessageOrderMailer.send_mess(m, settings.message_letter_subj).deliver
        else
          puts "<MessController.handle_message_order> errors: #{m.errors}"
          format.js { render json: m.errors, status: :unprocessable_entity }
        end
      end
    end

    def mess_params
      params.require(:mess).permit(:name, :email_or_phone, :comment, :kapcha, :subj_id)
    end

  end
end