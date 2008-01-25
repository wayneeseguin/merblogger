require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe "/discussions/edit" do
  before(:each) do
    @controller,@action = get("/discussions/edit")
    @body = @controller.body
  end

  it "should mention Discussions" do
    @body.should match(/Discussions/)
  end
end