# frozen_string_literal: true

class Platinum::Reel < Platinum::Base
  prop :gap, Integer, default: 1
  prop :height, Size, default: "auto"
  prop :colour, Colour, default: "neutral"
  prop :scrollbar, _Map(light: Shade, dark: Shade), default: {light: 600, dark: 400}.freeze
  prop :attributes, Hash, :**, default: {}.freeze

  def view_template(&)
    div(**mix(class: ["flex", "h-#{@height}", "overflow-x-auto", "overflow-y-hidden", "gap-#{@gap}", "*:flex"], **@attributes), &)
  end
end
