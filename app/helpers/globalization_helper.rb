module GlobalizationHelper
  def model_name(model, count = 1)
    model.model_name.human(count: count)
  end

  def model_name_pluralized(model)
    translate_model_name(model, 2)
  end

  def model_attribute(model, attribute, count = 1)
    model.human_attribute_name(attribute, count: count)
  end

  alias_method :tm, :model_name
  alias_method :tmp, :model_name_pluralized
  alias_method :ta, :model_attribute
end
