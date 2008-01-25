require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "Contents Controller", "index action" do
  before(:each) do
    @controller = Contents.build(fake_request)
    @controller.dispatch('index')
  end
end