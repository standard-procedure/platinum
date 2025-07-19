# frozen_string_literal: true

class Platinum::Slotted < Platinum::Base
  def initialize
    @vanishing = false
  end
  attr_reader :vanishing

  def before_template(&)
    @vanishing = true
    vanish(&)
    super
    @vanishing = false
  end
end
