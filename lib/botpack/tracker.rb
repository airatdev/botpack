module Botpack
  class Tracker
    def initialize(bot)
      @bot = bot
    end

    def track(event, message)
      @bot.track(
        event,
        message.from.id,
        sender: sender_attributes(message),
        chat_name: chat_name(message),
        text: message.text
      )
    end

    private

      def sender_attributes(message)
        {
          id: message.from.id,
          name: "#{message.from.first_name} #{message.from.last_name}",
          username: message.from.username
        }
      end

      def chat_name(message)
        if message.chat.type == "private"
          "#{message.chat.first_name} #{message.chat.last_name} (#{message.chat.username})"
        else
          message.chat.title
        end
      end
  end
end
