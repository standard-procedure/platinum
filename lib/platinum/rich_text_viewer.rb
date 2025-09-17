# frozen_string_literal: true

class Platinum::RichTextViewer < Platinum::Base
  def initialize rich_text, show_placeholder: false
    @rich_text = rich_text
    @show_placeholder = show_placeholder && @rich_text.to_plain_text.blank?
  end

  def view_template = @show_placeholder ? draw_placeholder : draw_rich_text

  private def draw_placeholder
    span(class: "text-neutral-300") { placeholder }
  end

  private def draw_rich_text
    div(class: "trix-content") { @rich_text.to_s }
  end

  private def placeholder = self.class.placeholder

  class << self
    def placeholder = @placeholder ||= "---"
    attr_writer :placeholder
  end
end
