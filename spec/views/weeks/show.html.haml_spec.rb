require 'spec_helper'

describe "weeks/show" do
  before(:each) do
    @week = assign(:week, stub_model(Week,
      :number => 1,
      :semester => 2,
      :event => "Event"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Event/)
  end
end
