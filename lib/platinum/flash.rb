# frozen_string_literal: true

class Platinum::Flash < Platinum::Base
  def initialize(flash = {})
    @flash = flash
  end

  def render? = @flash[:alert].present? || @flash[:notice].present?

  def view_template(&)
    Alert(:warning, text: @flash[:alert].to_s) if @flash[:alert].present?
    Alert(:info, text: @flash[:notice].to_s) if @flash[:notice].present?
  end
end
