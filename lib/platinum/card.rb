# frozen_string_literal: true

class Platinum::Card < Platinum::Slotted
  def initialize **attributes
    @image = nil
    @title = nil
    @attributes = mix(class: "mt-1 text-sm text-pretty text-neutral-700 w-full #{attributes.delete(:class)}", **attributes)
  end

  def image(&contents) = @image = contents

  def title(&contents) = @title = contents

  def view_template(&)
    div class: theme.card_outer do
      div class: theme.card_inner do
        if @image.present?
          div(class: "sm:order-last sm:shrink-0", &@image)
        end
        div class: "w-full" do
          if @title.present?
            h3(class: "text-lg font-medium text-pretty text-neutral-900", &@title)
          end
          div(**@attributes, &)
        end
      end
    end
  end
end
