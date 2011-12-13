require 'spec_helper'

describe "workout_tags/index.html.erb" do
  before(:each) do
    assign(:workout_tags, [
      stub_model(WorkoutTag,
        :category => "Category",
        :name => "Name"
      ),
      stub_model(WorkoutTag,
        :category => "Category",
        :name => "Name"
      )
    ])
  end

  it "renders a list of workout_tags" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
