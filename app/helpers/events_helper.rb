module EventsHelper
  def show_as_icon(event)
    kind = event.kind
    icon = if kind.eql? EventKind::GRADUATION
             'mdi-social-school circle'
           elsif kind.eql? EventKind::FAIR
             'mdi-action-today circle'
           elsif kind.eql? EventKind::WEDDING
             'mdi-action-favorite-outline circle'
           elsif kind.eql? EventKind::SOCIAL_EVENT
             'mdi-social-whatshot circle'
           elsif kind.eql? EventKind::BIRTHDAY
             'mdi-social-cake circle'
           end

    icon
    # tag(:i, class: icon, style: 'font-size: 22px', title: event.kind_humanize)
  end
end
