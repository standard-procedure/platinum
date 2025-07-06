# frozen_string_literal: true

class Platinum::Slotted < Platinum::Base
  def before_template(&)
    vanish(&)
    super
  end
end
