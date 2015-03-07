require 'rails_helper'

RSpec.describe 'events/new', type: :view do
  let(:event) { create :event }

  it 'renders new event form' do
    render

    assert_select 'form[action=?][method=?]', events_path, 'post' do
      assert_select 'input#event_hashtag[name=?]', 'event[hashtag]'
      assert_select 'input#event_title[name=?]', 'event[title]'
      assert_select 'input#event_image[name=?]', 'event[image]'
      assert_select 'input#event_kind[name=?]', 'event[kind]'
      assert_select 'input#event_user_id[name=?]', 'event[user_id]'
    end
  end
end
