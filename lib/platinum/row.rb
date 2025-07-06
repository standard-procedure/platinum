# frozen_string_literal: true

class Platinum::Row < Platinum::Flex
  def initialize gap: 1, justify: :between, items: :center, wrap: false, **attributes
    super(direction: "row", gap: gap, justify: justify, items: items, wrap: wrap, **attributes)
  end
end
