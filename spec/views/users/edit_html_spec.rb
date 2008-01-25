require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe "/users/edit" do
  before(:each) do
    @controller,@action = get("/users/edit")
    @body = @controller.body
  end

  it "should mention Users" do
    @body.should match(/Users/)
  end
end