require File.expand_path('../../../spec_helper', __FILE__)
require File.expand_path('../shared/each_line', __FILE__)

describe "ARGF.each_line" do
  it_behaves_like :argf_each_line, :each_line
end
