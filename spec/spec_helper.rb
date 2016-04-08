require 'bundler/setup'

Bundler.setup

require 'yandex/direct'

RSpec.configure do |config|
  config.before(:all) do
    Yandex::Direct.config File.join(File.dirname(__FILE__), '../yandex_direct.yml')
  end
end
