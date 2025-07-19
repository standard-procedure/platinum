# frozen_string_literal: true

class Platinum::Badge < Components::Base
  def initialize **attributes
    @class = [attributes.delete(:class) || theme.badge, theme.badge_frame]
  end

  def view_template(&) = span(class: @class, &)
end
