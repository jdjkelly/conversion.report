module ApplicationHelper
  def body_classes
    @body_classes.join(' ')
  end

  def body_has_class?(name)
    @body_classes.include?(name)
  end
end
