require 'spec_helper'

describe "weeks/index" do
  before(:each) do
    assign(:weeks, [
      stub_model(Week,
        :number => 1,
        :semester => 2,
        :event => "Event"
      ),
      stub_model(Week,
        :number => 1,
        :semester => 2,
        :event => "Event"
      )
    ])
  end

  it "renders a list of weeks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Event".to_s, :count => 2
  end
end
