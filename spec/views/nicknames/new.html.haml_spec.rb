require 'spec_helper'

describe "nicknames/new" do
  before(:each) do
    assign(:nickname, stub_model(Nickname,
      :name => "MyString",
      :comment => "MyText",
      :rating => 1,
      :week => nil
    ).as_new_record)
  end

  it "renders new nickname form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", nicknames_path, "post" do
      assert_select "input#nickname_name[name=?]", "nickname[name]"
      assert_select "textarea#nickname_comment[name=?]", "nickname[comment]"
      assert_select "input#nickname_rating[name=?]", "nickname[rating]"
      assert_select "input#nickname_week[name=?]", "nickname[week]"
    end
  end
end
