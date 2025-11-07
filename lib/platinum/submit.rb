# frozen_string_literal: true

class Platinum::Submit < Platinum::Slotted
  def initialize text = nil, cancel: true, cancel_url: nil, cancel_text: nil, style: "primary_button", **attributes
    @label = text
    @cancel = cancel
    @cancel_url = cancel_url
    @cancel_text = cancel_text
    @style = style
    @attributes = attributes
  end

  def label(&contents)
    @label = contents
  end

  def view_template(&extras)
    Row justify: "between" do
      Row justify: "start", class: "flex-1" do
        BackLink(url: @cancel_url, text: @cancel_text) if @cancel
        extras&.call
      end
      Row justify: "end", class: "shrink-0" do
        Button(@style, type: "submit", **attributes) { button_label }
      end
    end
  end

  private def button_label = @label.respond_to?(:call) ? @label.call : @label.to_s
end
