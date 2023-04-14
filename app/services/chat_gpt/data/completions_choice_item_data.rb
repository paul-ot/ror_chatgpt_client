module ChatGpt
  module Data
    class CompletionsChoiceItemData
      attr_reader :params

      def initialize(params)
        @params = params
      end

      def text
        params.dig('text')
      end

      def index
        params.dig('index')
      end

      def logprobs
        params.dig('logprobs')
      end

      def finish_reason
        params.dig('finish_reason')
      end
    end
  end
end
