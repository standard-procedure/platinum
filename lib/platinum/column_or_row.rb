# frozen_string_literal: true

class Platinum::ColumnOrRow < Platinum::Base
  prop :gap, Integer, default: 1
  prop :justify, Types.Enum("between", "start", "end", "evenly", "around", "center", "stretch"), default: "between"
  prop :items, Types.Enum("start", "end", "baseline", "center", "stretch"), default: "center"
  prop :wrap, _Boolean, default: true
  prop :attributes, Hash, :**, default: {}.freeze

  def view_template(&)
    div(**mix(class: ["flex", "flex-col", "md:flex-row", "gap-#{@gap}", "justify-#{@justify}", "items-#{@items}", @wrap ? "flex-wrap" : "flex-nowrap", @attributes.delete(:class)].flatten, **@attributes), &)
  end
end
