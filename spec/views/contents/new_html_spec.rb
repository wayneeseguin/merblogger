require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe "/contents/new" do
  before(:each) do
    @controller,@action = get("/contents/new")
    @body = @controller.body
  end

  it "should mention Contents" do
    @body.should match(/Contents/)
  end
end