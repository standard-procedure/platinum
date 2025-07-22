# frozen_string_literal: true

class Platinum::Button < Platinum::Base
  def initialize style = :button, type: "button", **attributes
    css = theme.config[style.to_sym] || theme.button
    @attributes = attributes.merge(type: type, class: attributes.delete(:class) || css)
  end

  def view_template(&)
    button(**@attributes, &)
  end
end
