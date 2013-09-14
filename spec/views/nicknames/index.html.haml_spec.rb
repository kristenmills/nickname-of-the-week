require 'spec_helper'

describe "nicknames/index" do
  before(:each) do
    assign(:nicknames, [
      stub_model(Nickname,
        :name => "Name",
        :comment => "MyText",
        :rating => 1,
        :week => nil
      ),
      stub_model(Nickname,
        :name => "Name",
        :comment => "MyText",
        :rating => 1,
        :week => nil
      )
    ])
  end

  it "renders a list of nicknames" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
