import consumer from "channels/consumer"

consumer.subscriptions.create("ChatRoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const container_msg = document.getElementById("messages");
    const user_id = document.getElementById("current_user_id").value;
    const input_box_val = document.getElementById("msg_send_input");
    if(data.message.user_id == user_id)
    {
      container_msg.insertAdjacentHTML("beforeend",data.mine)
    }
    else{
      container_msg.insertAdjacentHTML("beforeend",data.theirs)
    }
    container_msg.scrollTop = container_msg.scrollHeight
    input_box_val.value="";
  }
});
