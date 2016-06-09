class ChangeC80OrderFormMessageSubjIdType < ActiveRecord::Migration
  def self.up
    change_table :c80_order_form_message_orders do |t|
      t.change :subj_id, :string
    end
  end
  def self.down
    change_table :c80_order_form_message_orders do |t|
      t.change :subj_id, :integer
    end
  end
end