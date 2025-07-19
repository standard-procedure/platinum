# frozen_string_literal: true

class Platinum::Breadcrumb < Platinum::Base
  def view_template(&contents)
    Platinum::Row(gap: 1) do
      contents&.call
      Icon(theme.breadcrumb_icon, class: theme.muted)
    end
  end
end
