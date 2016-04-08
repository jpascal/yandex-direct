require 'active_model'
require 'active_model/serializers/json'

module Yandex::Direct
  class Base
    include ActiveModel::Model
    include ActiveModel::Serialization
    include ActiveModel::Validations
    class << self
      def initialize(*args)
        super
      end
      def create(attributes)
        object = self.new(attributes)
        object.save
      end

      delegate :call, :fields, :limit, :offset, :where, to: :selection_criteria
      def path
        self.name.demodulize.pluralize.downcase
      end
      protected
      def selection_criteria
        SelectionCriteria.new(self)
      end
    end

    def to_param
      self.serializable_hash(except: [:errors, :validation_context])
    end

    def save
      if self.valid?
        response = Direct.request('add', self.class.path, {'Campaigns' => [self.to_param]})
        puts response.inspect
      end
    end
  end
end
