class ItemStatus < EnumerateIt::Base
  associate_values approved: 1, removed: 2, listed: 3
end
