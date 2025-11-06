# frozen_string_literal: true

class Platinum::Column < Platinum::Flex
  def initialize gap: 2, justify: :start, items: :stretch, wrap: false, **attributes
    direction = wrap ? :wrapped_column : :column
    super(direction: direction, gap: gap, justify: justify, items: items, **attributes)
  end
end
