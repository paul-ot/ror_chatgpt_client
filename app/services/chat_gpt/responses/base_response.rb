module ChatGpt
  module Responses
    class BaseResponse < HttpResponse
      def error_message
        response_body.dig('error', 'message')
      end
    end
  end
end
