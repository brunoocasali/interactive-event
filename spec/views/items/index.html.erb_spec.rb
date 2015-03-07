require 'rails_helper'

RSpec.describe "items/index", :type => :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        :service => nil,
        :event => nil,
        :status => 1,
        :text => "MyText",
        :image_link => "Image Link"
      ),
      Item.create!(
        :service => nil,
        :event => nil,
        :status => 1,
        :text => "MyText",
        :image_link => "Image Link"
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Image Link".to_s, :count => 2
  end
end
