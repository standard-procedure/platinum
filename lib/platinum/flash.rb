# frozen_string_literal: true

class Platinum::Flash < Platinum::Base
  include Phlex::Rails::Helpers::Flash

  def initialize(flash = {})
    @flash = flash
  end

  def view_template(&)
    Alert(:warning, text: messages[:alert].to_s) if messages[:alert].present?
    Alert(:info, text: messages[:notice].to_s) if messages[:notice].present?
  end

  def messages = flash.merge(@flash)
end
