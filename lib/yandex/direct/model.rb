require 'active_model'

module Yandex
  module Direct
    class Model
      include Yandex::Direct::Structure
      include ActiveModel::Validations
      class << self
        def create(attributes)
          object = self.new(attributes)
          object.save
        end

        delegate :call, :fields, :limit, :offset, :where, to: :selection_criteria

        def path
          self.scope_name.downcase
        end

        def scope_name
          self.name.demodulize.pluralize
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
          response = Yandex::Direct.request('add', self.class.path, Hash[self.class.scope_name,[self.attributes.delete_if{|_, v| v.nil?}]])
          Yandex::Direct.parse(response, 'AddResults', Yandex::Direct::ActionResult)
        end
      end

      # TODO: add, update
    end
  end
end
