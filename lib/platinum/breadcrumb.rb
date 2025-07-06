# frozen_string_literal: true

class Platinum::Breadcrumb < Platinum::Base
  def view_template(&contents)
    Row(gap: 1) do
      contents&.call
      Icon("breadcrumb", class: theme.muted)
    end
  end
end
