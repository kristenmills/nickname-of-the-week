require 'spec_helper'

describe "suggestions/index" do
  before(:each) do
    assign(:suggestions, [
      stub_model(Suggestion,
        :name => "Name",
        :description => "MyText",
        :submitter => "Submitter"
      ),
      stub_model(Suggestion,
        :name => "Name",
        :description => "MyText",
        :submitter => "Submitter"
      )
    ])
  end

  it "renders a list of suggestions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Submitter".to_s, :count => 2
  end
end
