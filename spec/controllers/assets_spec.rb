require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "Assets Controller", "index action" do
  before(:each) do
    @controller = Assets.build(fake_request)
    @controller.dispatch('index')
  end
end