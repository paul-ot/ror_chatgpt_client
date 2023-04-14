module ChatGpt
  module Data
    class ChatCompletionsChoiceItemData
      attr_reader :params

      def initialize(params)
        @params = params
      end

      def index
        params.dig('index')
      end

      def text
        params.dig('message', 'content')
      end

      def finish_reason
        params.dig('finish_reason')
      end
    end
  end
end
