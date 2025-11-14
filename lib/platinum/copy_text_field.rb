# frozen_string_literal: true

class Platinum::CopyTextField < Platinum::Base
  include Phlex::Rails::Helpers::T

  def initialize text, **attributes
    @text = text
    @attributes = attributes
  end

  def view_template
    div(**mix(class: [theme.copy_text_field_container, @attributes.delete(:class)], data: {controller: "clipboard", clipboard_success_content_value: t(".copied")}, **@attributes)) do
      input type: "text", value: @text, readonly: true, data: {clipboard_target: "source"}, class: theme.input
      span class: theme.copy_text_field_button_container do
        a(href: "#", class: theme.copy_text_field_button, data: {action: "clipboard#copy", clipboard_target: "button"}) { Icon(theme.copy_icon) }
      end
    end
  end
end
