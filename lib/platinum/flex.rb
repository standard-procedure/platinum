# frozen_string_literal: true

class Platinum::Flex < Platinum::Base
  def initialize gap: 0, direction: "row", justify: :between, items: :center, wrap: false, **attributes
    @direction = "flex-#{direction}"
    @gap = "gap-#{gap}"
    @justify = JUSTIFY[justify.to_sym] || "justify-between"
    @items = ITEMS[items.to_sym] || "items-center"
    @wrap = wrap ? "flex-wrap" : "flex-nowrap"
    @class = attributes.delete(:class)
    @attributes = attributes
  end

  def view_template(&) = div(**mix(class: ["flex", @direction, @gap, @justify, @items, @wrap, @class], **@attributes), &)

  JUSTIFY = {center: "justify-center", start: "justify-start", end: "justify-end", between: "justify-between", stretch: "justify-stretch"}.freeze
  ITEMS = {center: "items-center", start: "items-start", end: "items-end", between: "items-between", baseline: "items-baseline", stretch: "items-stretch"}.freeze

  private_constant :JUSTIFY, :ITEMS
end
