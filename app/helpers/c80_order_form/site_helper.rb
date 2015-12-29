module C80OrderForm
  module SiteHelper

    def render_order_form(predefined_comment="",subj_id=-1)

      @settings = Settings.first

      render :partial => "c80_order_form/site/shared/order_form",
             :locals => {
                 :mess => "MessageOrder.new",
                 :predefined_comment => predefined_comment,
                 :subj_id => subj_id
             }

    end

    def render_ok_message
      settings = Settings.first
      render :partial => "c80_order_form/site/shared/ok_message",
             :locals => {
                 ok_text: settings.ok_text,
                 wtitle: settings.ok_text_title
             }
    end

  end
end