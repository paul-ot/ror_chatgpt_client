module ChatGpt
  module Responses
    class CompletionsResponse < BaseResponse
      def id
        response_body.dig('id')
      end

      def object
        response_body.dig('object')
      end

      def created
        response_body.dig('created')
      end

      def model
        response_body.dig('model')
      end

      def choices
        response_body.dig('choices') || [{}]
      end

      def choice
        ChatGpt::Data::CompletionsChoiceItemData.new(choice[0])
      end
    end
  end
end
