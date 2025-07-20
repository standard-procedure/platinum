# frozen_string_literal: true

class Platinum::DetailsList < Platinum::Slotted
  def initialize link_to: nil
    @items = []
    @link_to = link_to
  end

  def add(&title)
    Item.new(title).tap do |item|
      @items.push(item)
    end
  end

  def view_template(&)
    div class: "flow-root" do
      dl class: theme.list do
        @items.each do |item|
          Platinum::Row(items: "start", gap: 1, wrap: true, class: theme.list_item) do
            dt class: %w[w-full md:w-sm h-full] do
              @link_to.present? ? draw_edit_link_to(item.title) : item.title&.call
            end
            dd class: %w[flex-grow flex gap-1 justify-end] do
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

  class Item < Struct.new(:title, :contents)
    def with(&contents) = self.contents = contents
  end
  private_constant :Item
end
