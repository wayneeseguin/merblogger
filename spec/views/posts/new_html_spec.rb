require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe "/posts/new" do
  before(:each) do
    @controller,@action = get("/posts/new")
    @body = @controller.body
  end

  it "should mention Posts" do
    @body.should match(/Posts/)
  end
end