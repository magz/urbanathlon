require 'spec_helper'

describe "favorites/show.html.erb" do
  before(:each) do
    @favorite = assign(:favorite, stub_model(Favorite,
      :user_id => 1,
      :workout_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
