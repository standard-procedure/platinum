# frozen_string_literal: true

class Platinum::Icon < Platinum::Base
  def initialize icon, text: nil, **options
    @text = text
    @class = [options.delete(:class), lookup(icon)].compact
    @options = options
  end

  def view_template
    @text.nil? ? icon : icon_with_text
  end

  private def icon = i(**mix(class: @class, **@options))

  private def icon_with_text
    Row(gap: 1, justify: "start", **@options) do
      i(class: @class)
      span(class: "group-open:hidden") { @text }
    end
  end

  private def lookup(icon) = self.class.lookup(icon)

  def self.lookup(icon) = "bi-#{icon_map[icon.to_s] || icon.to_s}"

  def self.icon_map
    @icon_map ||= {}
  end

  def self.icon_map=(map)
    @icon_map = map
  end
end
