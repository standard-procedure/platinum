# frozen_string_literal: true

class Platinum::Search < Platinum::Base
  def initialize url, value = "", method: "get", label: nil, placeholder: nil, name: "search", **attributes
    @label = label
    @placeholder = placeholder
    @name = name
    @value = value
    data = (attributes.delete(:data) || {}).merge(controller: "search-form", turbo_frame: "_top")
    @attributes = mix(action: url, method: method, data: data, **attributes)
  end

  def view_template(&)
    form(**@attributes) do
      Platinum::Row(wrap: true, gap: 1, justify: "end", items: "start", class: "text-sm") do
        div class: "relative" do
          input type: "text", name: @name, value: @value, placeholder: @placeholder, class: theme.input, data: {search_form_target: "input"}, autofocus: true
          span class: "absolute inset-y-0 right-2 top-0 grid w-8 place-content-center" do
            a(href: "#", data: {action: "search-form#submit"}, class: theme.inset_button) { Icon(theme.search_icon) }
          end
          span class: "absolute inset-y-0 right-10 top-0 grid w-8 place-content-center" do
            a(href: "#", data: {action: "search-form#clearAndSubmit"}, class: theme.inset_danger_button) { Icon(theme.clear_icon) }
          end
        end
        button type: "submit", class: "hidden" do
          Icon(theme.search_icon)
        end
      end
    end
  end
end
