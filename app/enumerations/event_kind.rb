class EventKind < EnumerateIt::Base
  associate_values graduation: 1, wedding: 2, social_event: 3, fair: 4,
                   birthday: 5
end
