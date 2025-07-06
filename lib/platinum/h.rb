# frozen_string_literal: true

class Platinum::H < Platinum::Base
  def initialize size, **attributes
    @tag = :"h#{size}"
    @attributes = mix(class: [theme.h[size.to_i], attributes.delete(:class)], **attributes)
  end

  def view_template(&) = send(@tag, **@attributes, &)
end
