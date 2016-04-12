module Yandex
  module Direct
    module Cast
      def self.time(value)
        Time.parse(value.to_s)
      end
      def self.date(value)
        Date.parse(value.to_s)
      end
      def self.integer(value)
        value.to_i
      end
      def self.string(value)
        value.to_s
      end
      def self.float(value)
        value.to_f
      end
    end
  end
end