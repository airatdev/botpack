module Botpack
  class Listener
    def initialize(telegram_token, botan_token, logger)
      @telegram_token = telegram_token
      @botan_token = botan_token
      @logger = logger
    end

    def start
      Telegram::Bot::Client.run(@telegram_token, logger: @logger) do |bot|
        bot.enable_botan!(@botan_token)

        bot.listen do |message|
          respond(bot, message)
        end
      end
    end

    def respond(bot, message)
      Botpack::Responder.new(bot, message).respond
    end
  end
end
