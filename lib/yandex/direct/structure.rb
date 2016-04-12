module Yandex
  module Direct
    module Structure
      def self.included(base)
        base.extend ClassMethods
        base.include InstanceMethods
      end
      module InstanceMethods
        def initialize(attributes = {})
          attributes.each_pair do |name, value|
            if (options = self.class.fields[name.to_sym])
              type = options.fetch(:type, nil)
              if type.is_a?(Symbol) or type.is_a?(String)
                self.method("#{name}=").call( Yandex::Direct::Cast.method(type).call(value) )
              else
                self.method("#{name}=").call(type.new(value))
              end
            end
          end
        end
        def to_hash
          result = {}
          self.class.fields.each_pair do |field, options|
            type = options.fetch(:type, nil)
            if type.is_a?(Symbol) or type.is_a?(String)
              value = self.method(field).call
              result.merge!(Hash[field, self.method(field).call.to_s]) if value
            else
              value = self.method(field).call
              result.merge!(Hash[field, value.to_hash])
            end
          end
          result
        end
      end
      module ClassMethods
        def field(name, options = {})
          (@fields ||= {}).merge!(Hash[name.to_sym, options])
          attr_accessor name
        end
        def fields
          @fields || {}
        end
      end
    end
  end
end
