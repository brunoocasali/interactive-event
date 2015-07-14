module EventsHelper
  def show_as_icon(event)
    if event.graduation?
      'gray mdi-social-school circle'
    elsif event.fair?
      'blue mdi-action-today circle'
    elsif event.wedding?
      'pink mdi-action-favorite-outline circle'
    elsif event.social_event?
      'red mdi-social-whatshot circle'
    elsif event.birthday?
      'green mdi-social-cake circle'
    end
  end
end
