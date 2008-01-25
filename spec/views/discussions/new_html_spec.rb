require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe "/discussions/new" do
  before(:each) do
    @controller,@action = get("/discussions/new")
    @body = @controller.body
  end

  it "should mention Discussions" do
    @body.should match(/Discussions/)
  end
end