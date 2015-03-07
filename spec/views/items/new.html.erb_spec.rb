require 'rails_helper'

RSpec.describe "items/new", :type => :view do
  before(:each) do
    assign(:item, Item.new(
      :service => nil,
      :event => nil,
      :status => 1,
      :text => "MyText",
      :image_link => "MyString"
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input#item_service_id[name=?]", "item[service_id]"

      assert_select "input#item_event_id[name=?]", "item[event_id]"

      assert_select "input#item_status[name=?]", "item[status]"

      assert_select "textarea#item_text[name=?]", "item[text]"

      assert_select "input#item_image_link[name=?]", "item[image_link]"
    end
  end
end
