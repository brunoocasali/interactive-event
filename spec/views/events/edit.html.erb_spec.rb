require 'rails_helper'

RSpec.describe "events/edit", :type => :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :hashtag => "MyString",
      :title => "MyString",
      :image => "MyString",
      :kind => 1,
      :user => nil
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "input#event_hashtag[name=?]", "event[hashtag]"

      assert_select "input#event_title[name=?]", "event[title]"

      assert_select "input#event_image[name=?]", "event[image]"

      assert_select "input#event_kind[name=?]", "event[kind]"

      assert_select "input#event_user_id[name=?]", "event[user_id]"
    end
  end
end
