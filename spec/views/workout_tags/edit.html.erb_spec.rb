require 'spec_helper'

describe "workout_tags/edit.html.erb" do
  before(:each) do
    @workout_tag = assign(:workout_tag, stub_model(WorkoutTag,
      :category => "MyString",
      :name => "MyString"
    ))
  end

  it "renders the edit workout_tag form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => workout_tags_path(@workout_tag), :method => "post" do
      assert_select "input#workout_tag_category", :name => "workout_tag[category]"
      assert_select "input#workout_tag_name", :name => "workout_tag[name]"
    end
  end
end
