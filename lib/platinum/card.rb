# frozen_string_literal: true

class Platinum::Card < Platinum::Slotted
  def initialize **attributes
    @image = nil
    @title = nil
    @attributes = mix(class: "mt-1 text-sm text-pretty text-stone-700 w-full #{attributes.delete(:class)}", **attributes)
  end

  def image(&contents) = @image = contents

  def title(&contents) = @title = contents

  def view_template(&)
    div class: "block rounded-md border border-stone-50 bg-stone-50/30 hover:bg-white/50 hover:border-stone-200 p-4 shadow-sm sm:p-6" do
      div class: "sm:flex sm:justify-between sm:gap-4 lg:gap-6" do
        if @image.present?
          div(class: "sm:order-last sm:shrink-0", &@image)
        end
        div class: "w-full" do
          if @title.present?
            h3(class: "text-lg font-medium text-pretty text-stone-900", &@title)
          end
          div(**@attributes, &)
        end
      end
    end
  end
end
