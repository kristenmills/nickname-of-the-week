require 'spec_helper'

describe "weeks/new" do
  before(:each) do
    assign(:week, stub_model(Week,
      :number => 1,
      :semester => 1,
      :event => "MyString"
    ).as_new_record)
  end

  it "renders new week form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", weeks_path, "post" do
      assert_select "input#week_number[name=?]", "week[number]"
      assert_select "input#week_semester[name=?]", "week[semester]"
      assert_select "input#week_event[name=?]", "week[event]"
    end
  end
end
