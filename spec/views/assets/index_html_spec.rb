require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe "/assets" do
  before(:each) do
    @controller,@action = get("/assets")
    @body = @controller.body
  end

  it "should mention Assets" do
    @body.should match(/Assets/)
  end
end