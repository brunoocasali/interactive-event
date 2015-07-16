module ServicesHelper
  def service_as_icon(item)
    service = item.service

    case service
    when ServiceKind::TWITTER
      'fa fa-twitter twitter-color'
    when ServiceKind::FACEBOOK
      'fa fa-facebook-official facebook-color'
    else
      'fa fa-instagram insta-color'
    end
  end
end
