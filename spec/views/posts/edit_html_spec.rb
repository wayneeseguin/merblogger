require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe "/posts/edit" do
  before(:each) do
    @controller,@action = get("/posts/edit")
    @body = @controller.body
  end

  it "should mention Posts" do
    @body.should match(/Posts/)
  end
end