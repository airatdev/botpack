module Telegram
  module Bot
    module Botan
      attr_reader :botan

      def enable_botan!(token)
        @botan ||= Botan::Api.new(token)
      end

      def track(*args)
        botan.track(*args) if defined?(botan)
      end
    end
  end
end

Telegram::Bot::Client.send(:include, Telegram::Bot::Botan)
