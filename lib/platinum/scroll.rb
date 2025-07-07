# frozen_string_literal: true

class Platinum::Scroll < Platinum::Base
  def view_template(&) = figure(class: "max-w-100 overflow-x-auto", &)
end
