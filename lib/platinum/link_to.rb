# frozen_string_literal: true

class Platinum::LinkTo < Platinum::Base
  def initialize text = nil, icon: nil, **attributes
    @text = text
    @icon = icon
    @attributes = attributes
  end

  def view_template
    A(**@attributes) do
      @text.nil? ? yield : draw_text_and_icon
    end
  end

  private def draw_text_and_icon = @icon.nil? ? @text.to_s : Icon(@icon, text: @text.to_s)
end
