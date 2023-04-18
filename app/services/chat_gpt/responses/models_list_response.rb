module ChatGpt
  module Responses
    class ModelsListResponse < BaseResponse
      def data
        response_body.dig('data') | []
      end

      def items
        ChatGpt::Data::ModelsListData.new(data)
      end
    end
  end
end
