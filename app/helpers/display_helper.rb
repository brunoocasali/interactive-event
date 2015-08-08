module DisplayHelper
  def find_partial_for(item)
    if item.present?
      item.image? ? 'image' : 'text'
    else
      'send_your_content'
    end
  end
end
