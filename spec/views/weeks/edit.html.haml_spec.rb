require 'spec_helper'

describe "weeks/edit" do
  before(:each) do
    @week = assign(:week, stub_model(Week,
      :number => 1,
      :semester => 1,
      :event => "MyString"
    ))
  end

  it "renders the edit week form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", week_path(@week), "post" do
      assert_select "input#week_number[name=?]", "week[number]"
      assert_select "input#week_semester[name=?]", "week[semester]"
      assert_select "input#week_event[name=?]", "week[event]"
    end
  end
end
