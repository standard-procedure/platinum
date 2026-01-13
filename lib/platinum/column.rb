# frozen_string_literal: true

class Platinum::Column < Platinum::Base
  prop :gap, Integer, default: 1
  prop :justify, Types.Enum("between", "start", "end", "evenly", "around", "center", "stretch"), default: "between"
  prop :items, Types.Enum("start", "end", "baseline", "center", "stretch"), default: "stretch"
  prop :attributes, Hash, :**, default: {}.freeze

  def view_template(&)
    div(**mix(class: ["flex", "flex-col", "gap-#{@gap}", "justify-#{@justify}", "items-#{@items}", @attributes.delete(:class)].flatten, **@attributes), &)
  end
end
