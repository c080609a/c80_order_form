C80OrderForm::Engine.routes.draw do
  match '/message_order', :to => 'mess#handle_message_order', :via => :post
  match '/give_me_order_form', :to => 'site#give_me_form', :via => :post
end