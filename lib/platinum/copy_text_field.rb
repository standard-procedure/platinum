# frozen_string_literal: true

class Platinum::CopyTextField < Platinum::Slotted
  include Phlex::Rails::Helpers::T

  def initialize text, **attributes
    @text = text
    @attributes = attributes
  end

  def view_template
    div(**mix(class: ["relative", "w-full", @attributes.delete(:class)], data: {controller: "clipboard", clipboard_success_content_value: t(".copied")}, **@attributes)) do
      input type: "text", value: @text, readonly: true, data: {clipboard_target: "source"}, class: theme.input
      span class: "absolute inset-y-0 right-4 top-2 grid w-8 place-content-center bg-none rounded-md" do
        a(href: "#", class: "rounded-md px-2 py-1 text-neutral-400 bg-neutral-200/30 backdrop-blur-xs hover:bg-green-100 hover:text-green-700", data: {action: "clipboard#copy", clipboard_target: "button"}) { Icon "copy" }
      end
    end
  end
end
