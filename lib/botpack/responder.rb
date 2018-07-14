module Botpack
  class Responder
    def initialize(bot, message)
      @bot = bot
      @message = message
    end

    def respond
      return unless chance_proc? && answer

      send_message(answer.response)
      track(answer.key)
    end

    private

      def answer
        @answer ||= Botpack::Answer.children.find do |klass|
          klass.new(@message.text).check
        end
      end

      def chance_proc?
        rand(1..100) <= (ENV["CHANCE"] || 100).to_i
      end

      def send_message(text)
        @bot.api.send_message(chat_id: @message.chat.id, text: text)
      end

      def track(event)
        Botpack::Tracker.new(@bot).track(event, @message)
      end
  end
end
