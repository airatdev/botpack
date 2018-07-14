module Botpack
  class Answer
    attr_reader :message

    def initialize(message)
      @message = prepare_for_check(message)
    end

    def check
      return unless condition

      self
    end

    def self.response
      responses.sample
    end

    def self.condition(&block)
      define_method :condition, &block
    end

    def self.responses(array)
      define_singleton_method :responses do
        array
      end
    end

    def self.key
      to_s.downcase.split("::").last
    end

    private

      def prepare_for_check(message)
        message.downcase.delete(",")
      end
  end
end
