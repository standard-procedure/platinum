# frozen_string_literal: true

class Platinum::Flash < Platinum::Base
  include Phlex::Rails::Helpers::Flash

  def initialize(messages = {})
    @flash = flash.merge messages
  end

  def render? = @flash[:alert].present? || @flash[:notice].present?

  def view_template(&)
    Alert(:warning, text: @flash[:alert].to_s) if @flash[:alert].present?
    Alert(:info, text: @flash[:notice].to_s) if @flash[:notice].present?
  end
end
