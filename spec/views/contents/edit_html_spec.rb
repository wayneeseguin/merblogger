require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe "/contents/edit" do
  before(:each) do
    @controller,@action = get("/contents/edit")
    @body = @controller.body
  end

  it "should mention Contents" do
    @body.should match(/Contents/)
  end
end