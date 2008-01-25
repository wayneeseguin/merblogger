require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "Posts Controller", "index action" do
  before(:each) do
    @controller = Posts.build(fake_request)
    @controller.dispatch('index')
  end
end