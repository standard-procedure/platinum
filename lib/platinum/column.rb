# frozen_string_literal: true

class Platinum::Column < Platinum::Base
  prop :gap, Integer, default: 1
  prop :justify, Enum("between", "start", "end", "evenly", "around", "center", "stretch"), default: "between"
  prop :items, Enum("start", "end", "baseline", "center", "stretch"), default: "center"
  prop :attributes, Hash, :**, default: {}.freeze

  def view_template(&)
    div(**mix(class: ["flex", "flex-col", "gap-#{@gap}", "justify-#{@justify}", "items-#{@align}"], **@attributes), &)
  end
end
