require 'yaml'
require 'yandex/direct/version'
require 'yandex/direct/config'
require 'yandex/direct/client'
require 'yandex/direct/request'

module Yandex
  module Direct
    autoload :ActionResult, 'yandex/direct/action_result'
    autoload :SelectionCriteria, 'yandex/direct/selection_criteria'
    autoload :ExceptionNotification, 'yandex/direct/exception_notification'
    autoload :Error, 'yandex/direct/error'
    autoload :Cast, 'yandex/direct/cast'
    autoload :Structure, 'yandex/direct/structure'
    autoload :Model, 'yandex/direct/model'


    autoload :Campaign, 'yandex/direct/campaign'
    autoload :TextCampaign, 'yandex/direct/text_campaign'
  end
end
