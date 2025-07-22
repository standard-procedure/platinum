# frozen_string_literal: true

class Platinum::A < Platinum::Base
  def initialize active: false, **attributes
    css = active ? theme.link_active : theme.link
    @attributes = mix(class: attributes.delete(:class) || css, **attributes)
  end

  def view_template(&) = a(**@attributes, &)
end
