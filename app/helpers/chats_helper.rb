module ChatsHelper
    def recive_or_my_message(message)
      if current_user.id == message.user_id
       "<div class='chat-message my-message'>
          <div class='flex items-end justify-end mt-4'>
            <div class='flex flex-col space-y-2 text-xs max-w-xs mx-2 order-1 items-end'>
              <div class='rounded-lg inline-block bg-blue-600 rounded-bl-none'>

                <p class='text-gray-300 p-1'> #{message.user.email}</p>
                <span class='px-2 py-1 rounded-lg inline-block rounded-br-none text-white'> #{message.msg }.</span>

              </div>
            </div>

          </div>
        </div>"
      else
       "<div class='chat-message recive message'>
          <div class='flex items-end'>
            <div class='flex flex-col space-y-2 text-xs max-w-xs mx-2 order-2 items-start'>
              <div class='bg-gray-300 rounded-lg inline-block rounded-bl-none px-1'>
                <p class='text-gray-600 p-1'> #{message.user.email} </p>
                <span class='px-4 py-1 text-black'> #{message.msg}.</span>
              </div>
            </div>
          </div>
        </div>"
      end
    end
end
