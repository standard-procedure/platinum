# frozen_string_literal: true

class Platinum::Flex < Platinum::Base
  def initialize gap: 0, direction: :row, justify: :between, items: :center, **attributes
    @direction = DIRECTION[direction]
    @gap = GAP[gap.to_i]
    @justify = JUSTIFY[justify.to_sym] || "justify-between"
    @items = ITEMS[items.to_sym] || "items-center"
    @class = attributes.delete(:class)
    @attributes = attributes
  end

  def view_template(&) = div(**mix(class: ["flex", @direction, @gap, @justify, @items, @wrap, @class], **@attributes), &)

  DIRECTION = {row: "flex-row flex-no-wrap overflow-hidden", wrapped_row: "flex-row flex-wrap overflow-hidden", scrolling_row: "flex-row flex-nowrap overflow-y-hidden overflow-x-auto", column: "flex-column flex-nowrap overflow-hidden", wrapped_column: "flex-col flex-wrap overflow-hidden", scrolling_column: "flex-col flex-nowrap overflow-y-auto overflow-x-hidden"}
  JUSTIFY = {center: "justify-center", start: "justify-start", end: "justify-end", between: "justify-between", stretch: "justify-stretch"}.freeze
  ITEMS = {center: "items-center", start: "items-start", end: "items-end", between: "items-between", baseline: "items-baseline", stretch: "items-stretch"}.freeze
  GAP = %w[gap-0 gap-1 gap-2 gap-3 gap-4 gap-5 gap-6 gap-7 gap-8].freeze

  private_constant :DIRECTION, :JUSTIFY, :ITEMS, :GAP
end
