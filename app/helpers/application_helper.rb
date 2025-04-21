module ApplicationHelper
  def titleized_attribute(instance, attribute)
    instance.class.human_attribute_name(attribute).titleize
  end
end
