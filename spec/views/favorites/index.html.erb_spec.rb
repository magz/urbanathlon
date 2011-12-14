require 'spec_helper'

describe "favorites/index.html.erb" do
  before(:each) do
    assign(:favorites, [
      stub_model(Favorite,
        :user_id => 1,
        :workout_id => 1
      ),
      stub_model(Favorite,
        :user_id => 1,
        :workout_id => 1
      )
    ])
  end

  it "renders a list of favorites" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
