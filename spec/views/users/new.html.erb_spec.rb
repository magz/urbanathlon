require 'spec_helper'

describe "users/new.html.erb" do
  before(:each) do
    assign(:user, stub_model(User,
      :name => "MyString",
      :fb_id => "MyString",
      :score => 1,
      :followed_users => "MyText"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path, :method => "post" do
      assert_select "input#user_name", :name => "user[name]"
      assert_select "input#user_fb_id", :name => "user[fb_id]"
      assert_select "input#user_score", :name => "user[score]"
      assert_select "textarea#user_followed_users", :name => "user[followed_users]"
    end
  end
end
