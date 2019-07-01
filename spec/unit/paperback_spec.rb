# typed: false
RSpec.describe Paperback do
  it 'should have a version number' do
    expect(Paperback::VERSION).to be_a(String)
  end
end
