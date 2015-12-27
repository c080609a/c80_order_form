ActiveAdmin.register C80OrderForm::MessageOrder, :as => 'MessageOrder' do

  before_filter :skip_sidebar!, :only => :index

  menu :parent => 'Сообщения', :label => 'Заявки' # TODO_MY:: слово "заявки" перенести в базу, в настройки гема

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