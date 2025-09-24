# frozen_string_literal: true

class Platinum::Row < Platinum::Flex
  def initialize(gap: 1, justify: :between, items: :center, wrap: true, **attributes)
    direction = wrap ? :wrapped_row : :scrolling_row
    super(direction: direction, gap: gap, justify: justify, items: items, **attributes)
  end
end
