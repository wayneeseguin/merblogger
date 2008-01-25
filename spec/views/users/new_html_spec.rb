require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe "/users/new" do
  before(:each) do
    @controller,@action = get("/users/new")
    @body = @controller.body
  end

  it "should mention Users" do
    @body.should match(/Users/)
  end
end