require 'rails_helper'

RSpec.describe "services/index", type: :view do
  before(:each) do
    assign(:services, [
      Service.create!(
        :name => "Name"
      ),
      Service.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of services" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
