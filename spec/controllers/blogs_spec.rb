require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe Blogs, "index action" do
  before(:each) do
    dispatch_to(Blogs, :index)
  end
end