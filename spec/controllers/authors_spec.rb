require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe Authors, "index action" do
  before(:each) do
    dispatch_to(Authors, :index)
  end
end