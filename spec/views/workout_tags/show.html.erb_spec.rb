require 'spec_helper'

describe "workout_tags/show.html.erb" do
  before(:each) do
    @workout_tag = assign(:workout_tag, stub_model(WorkoutTag,
      :category => "Category",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Category/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
