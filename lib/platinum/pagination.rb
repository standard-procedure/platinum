# frozen_string_literal: true

class Platinum::Pagination < Platinum::Slotted
  def initialize collection, url_generator = nil
    @collection = collection
    @range = (1..@collection.total_pages)
    @url_generator = url_generator
    @inner_class = theme.pagination_inner
    @inner_text_class = theme.pagination_text
  end

  def render? = @collection.total_pages > 1

  def view_template
    Platinum::Row(class: @inner_class, gap: 4, items: "center") do
      render Link.new(link_for(1), label: :first)
      render Link.new(link_for(@collection.prev_page), label: :previous)
      span(class: @inner_text_class) { "#{@collection.current_page}/#{@collection.total_pages}" }
      render Link.new(link_for(@collection.next_page), label: :next)
      render Link.new(link_for(@collection.total_pages), label: :last)
    end
  end

  private def link_for(page_number) = show_link_for?(page_number) ? @url_generator&.call(page_number) : nil

  private def show_link_for?(page_number) = @range.include?(page_number) && (page_number != @collection.current_page)

  class Link < Platinum::Base
    def initialize url, label:
      @url = url || "#"
      @label = label
    end

    def view_template
      a(href: @url, **options) { Icon(@label) }
    end

    private def options = (@url == "#") ? {class: "invisible"} : {class: theme.pagination_link, rel: @label}
  end
end
