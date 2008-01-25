require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe "/assets/new" do
  before(:each) do
    @controller,@action = get("/assets/new")
    @body = @controller.body
  end

  it "should mention Assets" do
    @body.should match(/Assets/)
  end
end