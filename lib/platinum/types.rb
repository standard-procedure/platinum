module Platinum
  module Types
    def self.Enum(*values) = proc { |v| values.include? v }
    def self.Size = Enum(*SIZES)
    def self.Colour = Enum(*COLOURS)
    def self.Shade = Enum(50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950)
    def self.Flex = Enum("between", "start", "end", "evenly", "around", "center", "stretch")

    SIZES = %w[none xs sm md lg xl auto full min max fit svh svw].freeze
    COLOURS = %w[red orange amber yellow lime green emerald teal cyan sky blue indigo violet purple fuchsia pink rose slate gray zinc neutral stone].freeze
  end
end
