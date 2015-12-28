module C80OrderForm
  class SiteController < ApplicationController
    def give_me_form
      @predefined_comment = params[:predefined_comment]
    end
  end
end