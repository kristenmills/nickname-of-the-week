require 'spec_helper'

describe "suggestions/new" do
  before(:each) do
    assign(:suggestion, stub_model(Suggestion,
      :name => "MyString",
      :description => "MyText",
      :submitter => "MyString"
    ).as_new_record)
  end

  it "renders new suggestion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", suggestions_path, "post" do
      assert_select "input#suggestion_name[name=?]", "suggestion[name]"
      assert_select "textarea#suggestion_description[name=?]", "suggestion[description]"
      assert_select "input#suggestion_submitter[name=?]", "suggestion[submitter]"
    end
  end
end
