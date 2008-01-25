require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe "/blogs/edit" do
  before(:each) do
    @controller,@action = get("/blogs/edit")
    @body = @controller.body
  end

  it "should mention Blogs" do
    @body.should match(/Blogs/)
  end
end