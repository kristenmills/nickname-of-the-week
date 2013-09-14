require 'spec_helper'

describe "suggestions/show" do
  before(:each) do
    @suggestion = assign(:suggestion, stub_model(Suggestion,
      :name => "Name",
      :description => "MyText",
      :submitter => "Submitter"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Submitter/)
  end
end
