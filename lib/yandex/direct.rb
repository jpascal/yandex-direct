require 'yaml'
require 'yandex/direct/version'
require 'yandex/direct/config'
require 'yandex/direct/client'
require 'yandex/direct/request'
require 'yandex/direct/models'

module Yandex
  module Direct
    autoload :ActionResult, 'yandex/direct/action_result'
    autoload :SelectionCriteria, 'yandex/direct/selection_criteria'
    autoload :ExceptionNotification, 'yandex/direct/exception_notification'
    autoload :Error, 'yandex/direct/error'
    autoload :Base, 'yandex/direct/base'
  end
end
