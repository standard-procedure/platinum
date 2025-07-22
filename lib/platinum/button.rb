# frozen_string_literal: true

class Platinum::Button < Platinum::Base
  def initialize style = :primary_button, type: "button", **attributes
    @class = theme.config[style.to_sym] || theme.button 
    @attributes = attributes.merge(type: type, class: [@class, attributes.delete(:class)])
  end

  def view_template(&)
    button(**@attributes, &)
  end
end
