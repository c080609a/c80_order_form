class AddSubjIdToC80OrderFormMessageOrders < ActiveRecord::Migration
  def change
    add_column :c80_order_form_message_orders, :subj_id, :integer
  end
end