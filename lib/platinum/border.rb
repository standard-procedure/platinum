# frozen_string_literal: true

class Platinum::Border < Platinum::Base
  prop :padding, Integer, default: 1
  prop :radius, Types.Size, default: "sm"
  prop :colour, Types.Colour, default: "neutral"
  prop :background, _Map(light: Types.Shade, dark: Types.Shade), default: {light: 50, dark: 800}.freeze
  prop :border, _Map(light: Types.Shade, dark: Types.Shade), default: {light: 100, dark: 900}.freeze
  prop :attributes, Hash, :**, default: {}.freeze

  def view_template(&)
    div(**mix(class: ["border", padding_class, radius_class, light_class, dark_class], **@attributes), &)
  end

  private def padding_class = "p-#{@padding}"
  private def radius_class = "rounded-#{@radius}"
  private def light_class = "bg-#{@colour}-#{@background[:light]} border-#{@colour}-#{@border[:light]}"
  private def dark_class = "dark:bg-#{@colour}-#{@background[:light]} dark:border-#{@colour}-#{@border[:dark]}"
end
