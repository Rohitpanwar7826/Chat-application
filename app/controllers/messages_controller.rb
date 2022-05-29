class MessagesController < ApplicationController
  def create
    msg_obj=current_user.messages.new(permit_message_params)
    if msg_obj.save
    # if true
      ActionCable.server.broadcast "chat_room_channel",{
      mine: mine_message(msg_obj) ,
      theirs: theirs_message(msg_obj),
      message: msg_obj}

    else
      redirect_to root_path
    end

  end

  private
  def permit_message_params
    params.require(:message).permit(:msg)
  end

  def mine_message(message)
    render_to_string partial: "mine_message" ,locals: {message: message}
  end

  def theirs_message(message)
    render_to_string(partial: "theirs_message" , locals: {message: message})
  end

end
