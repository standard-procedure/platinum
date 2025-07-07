# frozen_string_literal: true

class Platinum::Expander < Platinum::Base
  def initialize icon: nil
    @icon = icon || theme.expander_icon
  end

  def view_template
    details class: ["group [&_summary::-webkit-details-marker]:hidden transition duration-500", theme.expander] do
      summary(class: "flex justify-end") do
        span(class: "shrink-0 transition duration-200 group-open:rotate-45") do
          Icon @icon
        end
      end
      yield
    end
  end
end
