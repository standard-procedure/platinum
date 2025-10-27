# frozen_string_literal: true

class Platinum::Badge < Platinum::Base
  def initialize style: nil, **attributes
    @class = [attributes.delete(:class) || theme.send(style || :badge), theme.badge_frame]
  end

  def view_template(&) = span(class: @class, &)
end
