require  'spec_helper'

describe Yandex::Direct::Structure do
  it '#field' do
    class Bar
      include Yandex::Direct::Structure
      field :Time, type: :time
    end
    class Foo
      include Yandex::Direct::Structure
      field :Integer, type: :integer
      field :Date, type: :date
      field :Time, type: :time
      field :Float, type: :float
      field :Bar, type: Bar
    end
    foo = Foo.new(Time: Time.now, Date: Time.now.to_s, Bar: {Time: Time.now})
    expect(Foo.new(foo.to_hash).to_hash).to eql(foo.to_hash)
  end
  it '#asd' do
    puts Yandex::Direct::Campaign.limit(2).call(:get)
  end
end