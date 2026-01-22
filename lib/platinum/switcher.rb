# frozen_string_literal: true

class Platinum::Switcher < Platinum::Base
  prop :attributes, Hash, :**, default: {}.freeze

  def view_template(&)
    div class: %w[@container] do
      div(**mix(class: %w[flex flex-wrap flex-col justify-start items-stretch @md:flex-row @md:justify-start @md:items-end], **@attributes), &)
    end
  end

  private def gap_class = GAP_CLASS[@gap] || GAP_CLASS.last
  GAP_CLASS = %w[gap-0 gap-1 gap-2 gap-3 gap-4 gap-5 gap-6 gap-7 gap-8].freeze
end
