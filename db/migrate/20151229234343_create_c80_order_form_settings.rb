class CreateC80OrderFormSettings < ActiveRecord::Migration
  def change
    create_table :c80_order_form_settings, :options => 'COLLATE=utf8_unicode_ci' do |t|
      t.string :order_form_title
      t.string :order_form_label_name
      t.string :order_form_label_email_or_phone
      t.string :order_form_label_comment
      t.string :order_form_label_button_send
      t.string :order_form_label_button_sending
      t.string :ok_text
      t.string :ok_text_title
      t.string :admin_label_menu
      t.text   :message_text
      t.string :message_letter_subj
      t.timestamps
    end
  end
end