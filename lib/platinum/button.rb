# frozen_string_literal: true

class Platinum::Button < Platinum::Base
  def initialize style = :button, type: "button", **attributes
    @class = [theme.config[style.to_sym], attributes.delete(:class)].compact
    @attributes = attributes.merge(type: type).merge(class: @class)
  end

  def view_template(&)
    button(**@attributes, &)
  end
end
