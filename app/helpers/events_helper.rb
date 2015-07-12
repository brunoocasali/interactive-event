module EventsHelper
  def show_as_icon(event)
    kind = event.kind
    if kind.eql? EventKind::GRADUATION
      'gray mdi-social-school circle'
    elsif kind.eql? EventKind::FAIR
      'blue mdi-action-today circle'
    elsif kind.eql? EventKind::WEDDING
      'pink mdi-action-favorite-outline circle'
    elsif kind.eql? EventKind::SOCIAL_EVENT
      'red mdi-social-whatshot circle'
    elsif kind.eql? EventKind::BIRTHDAY
      'green mdi-social-cake circle'
    end
  end
end
