# frozen_string_literal: true

class Platinum::Expander < Platinum::Base
  def initialize icon: nil, **attributes
    @icon = icon || theme.expander_icon
    @attributes = attributes
  end

  def view_template
    details(**mix(class: ["group [&_summary::-webkit-details-marker]:hidden transition duration-500", theme.expander, @attributes.delete(:class)], **@attributes)) do
      summary(class: "flex justify-start") do
        span(class: theme.expander_summary) do
          Icon @icon
        end
      end
      yield
    end
  end
end
