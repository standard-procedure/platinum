# frozen_string_literal: true

class Platinum::Inset < Platinum::Base
  prop :padding, Integer, default: 1
  prop :size, Size, default: "sm"
  prop :colour, Colour, default: "neutral"
  prop :background, _Map(light: Shade, dark: Shade), default: {light: 50, dark: 800}.freeze
  prop :shadow, _Map(light: Shade, dark: Shade), default: {light: 100, dark: 900}.freeze
  prop :attributes, Hash, :**, default: {}.freeze

  def view_template(&)
    div(**mix(class: [padding_class, inset_class, light_colour, dark_colour], **@attributes), &)
  end

  private def padding_class = "p-#{@padding}"
  private def inset_class = "inset-shadow-#{@size}"
  private def light_colour = "bg-#{@colour}-#{@light_background} inset-shadow-#{@colour}-#{@light}"
  private def dark_colour = "dark:bg-#{@colour}-#{@dark} dark:inset-shadow-#{@colour}-#{@dark}"
end
