require 'rails_helper'

RSpec.describe 'events/show', type: :view do
  let(:event) { create :event }

  it 'renders attributes in <p>' do
    render

    expect(rendered).to match(/Hashtag/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
  end
end
