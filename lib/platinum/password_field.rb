# frozen_string_literal: true

class Platinum::PasswordField < Platinum::Base
  def initialize form, attribute = :password, **attributes
    @form = form
    @attribute = attribute
    data = (attributes.delete(:data) || {}).merge(password_visibility_target: "input")
    @attributes = mix(class: [theme.input, attributes.delete(:class)], data: data, **attributes)
  end

  def view_template
    div class: "flow-root" do
      div class: "relative w-full", data: {controller: "password-visibility"} do
        @form.password_field @attribute, **@attributes
        span class: "absolute inset-y-0 right-2 top-0 grid w-8 place-content-center" do
          a href: "#", class: theme.inset_button, data: {action: "password-visibility#toggle"} do
            span(data: {password_visibility_target: "icon"}) { Icon(theme.show_password_icon) }
            span(class: "hidden", data: {password_visibility_target: "icon"}) { Icon(theme.hide_password_icon) }
          end
        end
      end
    end
  end
end
