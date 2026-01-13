# frozen_string_literal: true

class Platinum::Breadcrumb < Platinum::Base
  def view_template(&contents)
    div class: %w[flex flex-row justify-start items-center gap-1 flex-nowrap] do
      contents&.call
      Icon(theme.breadcrumb_icon, class: theme.muted, wrap: false)
    end
  end
end
