module Yandex
  module Direct
    class ExceptionNotification
      include ActiveModel::Model
      attr_accessor :Message, :Details, :Code
    end
  end
end
