module Yandex::Direct
  class ActionResult
    include ActiveModel::Model
    attr_accessor :Id, :Warnings, :Errors
    def initialize(*args)
      super
      self.Warnings = Array(self.Warnings).map{|attributes| ExceptionNotification.new(attributes)}
      self.Errors = Array(self.Errors).map{|attributes| ExceptionNotification.new(attributes)}
    end
    def errors?
      Array(self.Errors).compact.any?
    end
    def warnings?
      Array(self.Warnings).compact.any?
    end
  end
end
