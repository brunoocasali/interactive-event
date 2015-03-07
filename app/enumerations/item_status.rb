class ItemStatus < EnumerateIt::Base
  associate_values :approved, :removed
end
