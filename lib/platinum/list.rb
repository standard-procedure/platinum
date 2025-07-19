# frozen_string_literal: true

class Platinum::List < Platinum::Slotted
  def initialize **attributes
    @attributes = mix(class: [theme.list, attributes.delete(:class)], **attributes)
    @list_items = []
  end

  def item(**attributes, &contents) = @list_items << [contents, attributes]

  def view_template(&)
    ul(**@attributes) do
      @list_items.each do |list_item|
        li(**mix(class: [list_item.last.delete(:class), theme.list_item], **list_item.last), &list_item.first)
      end
    end
  end
end
