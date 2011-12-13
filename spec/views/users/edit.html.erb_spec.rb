require 'spec_helper'

describe "users/edit.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "MyString",
      :fb_id => "MyString",
      :score => 1,
      :followed_users => "MyText"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path(@user), :method => "post" do
      assert_select "input#user_name", :name => "user[name]"
      assert_select "input#user_fb_id", :name => "user[fb_id]"
      assert_select "input#user_score", :name => "user[score]"
      assert_select "textarea#user_followed_users", :name => "user[followed_users]"
    end
  end
end
