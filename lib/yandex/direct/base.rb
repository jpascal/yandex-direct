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

      def field(name, options = {})
        (@fields ||= {}).merge!(Hash[name, options])
        attr_accessor name
      end

      def fields
        @fields || {}
      end

      protected
      def selection_criteria
        SelectionCriteria.new(self)
      end
    end

    def attributes
      self.class.fields.keys.map{|key| Hash[key, instance_variable_get("@#{key}")] }.inject(&:merge)
    end

    def save
      if self.valid?
        response = Yandex::Direct.request('add', self.class.path, {'Campaigns' => [self.attributes.delete_if{|_, v| v.nil?}]})
        puts response.inspect
      end
    end
  end
end
