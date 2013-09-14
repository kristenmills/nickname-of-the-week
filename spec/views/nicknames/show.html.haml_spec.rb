require 'spec_helper'

describe "nicknames/show" do
  before(:each) do
    @nickname = assign(:nickname, stub_model(Nickname,
      :name => "Name",
      :comment => "MyText",
      :rating => 1,
      :week => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(//)
  end
end
