# frozen_string_literal: true

class Platinum::Inset < Platinum::Base
  prop :padding, Integer, default: 1
  prop :size, Types.Size, default: "sm"
  prop :colour, Types.Colour, default: "neutral"
  prop :shadow, _Map(light: Types.Shade, dark: Types.Shade), default: {light: 200, dark: 800}.freeze
  prop :attributes, Hash, :**, default: {}.freeze

  def view_template(&)
    div(**mix(class: [padding_class, inset_class, light_colour, dark_colour, @attributes.delete(:class)].flatten, **@attributes), &)
  end

  private def padding_class = "p-#{@padding}"
  private def inset_class = "inset-shadow-#{@size}"
  private def light_colour = "inset-shadow-#{@colour}-#{@shadow[:light]} border-#{@colour}-#{@shadow[:light]}"
  private def dark_colour = "dark:inset-shadow-#{@colour}-#{@shadow[:dark]} dark:border-#{@colour}-#{@shadow[:dark]}"
end
