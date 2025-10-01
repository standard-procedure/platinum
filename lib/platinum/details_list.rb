# frozen_string_literal: true

class Platinum::DetailsList < Platinum::Slotted
  def initialize link_to: nil, **attributes
    @items = []
    @link_to = link_to
    @attributes = mix(class: [theme.list, attributes.delete(:class)], **attributes)
  end

  def add(**attributes, &title)
    Item.new(title, mix(class: ["flex-grow flex gap-1 justify-end", attributes.delete(:class)], **attributes)).tap do |i|
      @items.push i
    end
  end

  def view_template(&)
    div class: "flow-root" do
      dl(**@attributes) do
        @items.each do |item|
          Platinum::Row(items: "start", gap: 1, wrap: true, class: theme.list_item) do
            dt class: %w[w-full md:w-sm h-full] do
              @link_to.present? ? draw_edit_link_to(item.title) : item.title&.call
            end
            dd(**item.attributes) do
              @link_to.present? ? a(**@link_to, &item.contents) : item.contents&.call
            end
          end
        end
      end
    end
  end

  private def draw_edit_link_to title
    a(**@link_to) do
      Platinum::Row(justify: "start", gap: 1) do
        Icon(theme.edit_icon)
        span(&title)
      end
    end
  end

  class Item < Struct.new(:title, :attributes, :contents)
    def with(&contents) = self.contents = contents
  end
  private_constant :Item
end
