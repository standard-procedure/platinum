# frozen_string_literal: true

class Platinum::RichTextViewer < Platinum::Base
  def initialize rich_text, show_placeholder: false, placeholder: nil
    @rich_text = rich_text
    @show_placeholder = show_placeholder && to_plain_text.blank?
    @placeholder = placeholder || self.class.placeholder
  end

  def view_template = @show_placeholder ? draw_placeholder : draw_rich_text

  private def to_plain_text = @rich_text.respond_to?(:to_plain_text) ? @rich_text.to_plain_text : @rich_text.to_s

  private def draw_placeholder
    span(class: "text-neutral-300") { @placeholder.to_s }
  end

  private def draw_rich_text
    div(class: "trix-content") { @rich_text.to_s }
  end

  class << self
    def placeholder = @placeholder ||= "---"
    attr_writer :placeholder
  end
end
