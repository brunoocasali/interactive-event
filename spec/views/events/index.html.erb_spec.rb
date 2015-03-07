require 'rails_helper'

RSpec.describe 'events/index', type: :view do
  let(:event) { create_list(:event, 2) }

  it 'renders a list of events' do
    render

    assert_select 'tr>td', text: 'Hashtag'.to_s, count: 2
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
    assert_select 'tr>td', text: 'Image'.to_s, count: 2
    assert_select 'tr>td', text: 1.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
