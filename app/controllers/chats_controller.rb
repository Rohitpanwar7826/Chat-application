class ChatsController < ApplicationController
  def index
    if current_user
      @message = Message.new
      @messages = Message.all 
    else
      redirect_to sign_in_path	
    end
  end
end
