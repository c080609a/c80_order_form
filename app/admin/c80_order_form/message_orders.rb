ActiveAdmin.register C80OrderForm::MessageOrder, :as => 'MessageOrder' do

  before_filter :skip_sidebar!, :only => :index

  if ActiveRecord::Base.connection.table_exists?('c80_order_form_settings')
    menu :parent => 'Сообщения', :label => C80OrderForm::Settings.first.admin_label_menu if C80OrderForm::Settings.first.present?
  end

  index do
    selectable_column
    id_column
    column :created_at
    column :name
    column :email_or_phone
    column :comment do |msg|
      msg.comment.html_safe if msg.comment.present?
    end

    actions
  end

end