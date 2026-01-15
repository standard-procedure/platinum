# frozen_string_literal: true

class Platinum::ColumnOrRow < Platinum::Base
  prop :gap, Integer, default: 1
  prop :column, _Map(justify: Types.Enum("between", "start", "end", "evenly", "around", "center", "stretch"), items: Types.Enum("start", "end", "baseline", "center", "stretch"), wrap: _Boolean), default: {justify: "start", items: "stretch", wrap: false}.freeze
  prop :row, _Map(justify: Types.Enum("between", "start", "end", "evenly", "around", "center", "stretch"), items: Types.Enum("start", "end", "baseline", "center", "stretch"), wrap: _Boolean), default: {justify: "start", items: "center", wrap: true}.freeze
  prop :attributes, Hash, :**, default: {}.freeze

  def view_template(&)
    div class: "@container" do
      div(**mix(class: ["flex", "flex-col", "gap-#{@gap}", "justify-#{@column[:justify]}", "items-#{@column[:items]}", @column[:wrap] ? "flex-wrap" : "flex-nowrap", "@md:flex-row", "@md:justify-#{@row[:justify]}", "@md:items-#{@row[:items]}", @row[:wrap] ? "@md:flex-wrap" : "@md:flex-nowrap", @attributes.delete(:class)].flatten, **@attributes), &)
    end
  end
end
