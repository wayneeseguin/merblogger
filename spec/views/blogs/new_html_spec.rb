require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe "/blogs/new" do
  before(:each) do
    @controller,@action = get("/blogs/new")
    @body = @controller.body
  end

  it "should mention Blogs" do
    @body.should match(/Blogs/)
  end
end