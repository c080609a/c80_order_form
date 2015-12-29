class ChangeC80OrderFormMessageOrderComment < ActiveRecord::Migration
  def self.up
    change_table :c80_order_form_message_orders do |t|
      t.change :comment, :text
    end
  end
  def self.down
    change_table :c80_order_form_message_orders do |t|
      t.change :comment, :string
    end
  end
end