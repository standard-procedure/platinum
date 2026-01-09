# frozen_string_literal: true

class Platinum::Card < Platinum::Slotted
  def initialize **attributes
    @image = nil
    @title = nil
    @attributes = attributes
  end

  def image(&contents) = @image = contents

  def title(&contents) = @title = contents

  def view_template(&)
    div class: theme.card_outer do
      div class: theme.card_inner do
        if @image.present?
          div(class: "sm:order-last sm:shrink-0", &@image)
        end
        if @title.present?
          H(3, &@title)
        end
        div(**@attributes, &)
      end
    end
  end
end
