module ServicesHelper
  def service_as_icon(service)
    case service
    when ServiceKind::TWITTER
      'fa fa-twitter twitter-color'
    when ServiceKind::INSTAGRAM
      'fa fa-instagram insta-color'
    else
      'fa fa-facebook-official facebook-color'
    end
  end
end
