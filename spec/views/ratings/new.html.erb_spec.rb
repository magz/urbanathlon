require 'spec_helper'

describe "ratings/new.html.erb" do
  before(:each) do
    assign(:rating, stub_model(Rating,
      :value => 1,
      :user_id => 1,
      :workout_id => 1
    ).as_new_record)
  end

  it "renders new rating form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ratings_path, :method => "post" do
      assert_select "input#rating_value", :name => "rating[value]"
      assert_select "input#rating_user_id", :name => "rating[user_id]"
      assert_select "input#rating_workout_id", :name => "rating[workout_id]"
    end
  end
end
