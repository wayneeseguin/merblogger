require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "Users Controller", "index action" do
  before(:each) do
    @controller = Users.build(fake_request)
    @controller.dispatch('index')
  end
end