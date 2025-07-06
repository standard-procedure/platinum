# frozen_string_literal: true

class Platinum::Column < Platinum::Flex
  def initialize gap: 2, justify: :start, items: :stretch, wrap: false, **attributes
    super(direction: "col", gap: gap, justify: justify, items: items, wrap: wrap, **attributes)
  end
end
