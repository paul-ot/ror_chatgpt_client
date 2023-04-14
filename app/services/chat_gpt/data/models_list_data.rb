module ChatGpt
  module Data
    class ModelsListData
      include Enumerable
      extend Forwardable

      def initialize(values = [])
        @values = values || []
      end

      def_delegators :@values, :<<, :[], :[]=, :last
      def_delegator :@values, :<<, :add

      def each
        @values.each  do |value|
          yield ChatGpt::Data::ModelsItemData.new(value)
        end
      end
    end
  end
end
