require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe Comments, "index action" do
  before(:each) do
    dispatch_to(Comments, :index)
  end
end