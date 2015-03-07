require 'rails_helper'

RSpec.describe "events/index", :type => :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :hashtag => "Hashtag",
        :title => "Title",
        :image => "Image",
        :kind => 1,
        :user => nil
      ),
      Event.create!(
        :hashtag => "Hashtag",
        :title => "Title",
        :image => "Image",
        :kind => 1,
        :user => nil
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => "Hashtag".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
