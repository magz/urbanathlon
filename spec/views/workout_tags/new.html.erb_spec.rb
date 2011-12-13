require 'spec_helper'

describe "workout_tags/new.html.erb" do
  before(:each) do
    assign(:workout_tag, stub_model(WorkoutTag,
      :category => "MyString",
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new workout_tag form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => workout_tags_path, :method => "post" do
      assert_select "input#workout_tag_category", :name => "workout_tag[category]"
      assert_select "input#workout_tag_name", :name => "workout_tag[name]"
    end
  end
end
