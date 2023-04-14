module ChatGpt
  module Data
    class ModelsItemData
      attr_reader :params

      def initialize(params)
        @params = params
      end

      def id
        params.dig('id')
      end

      def object
        params.dig('object')
      end

      def owned_by
        params.dig('owned_by')
      end

      def permission
        params.dig('permission')
      end
    end
  end
end
