# frozen_string_literal: true

class Platinum::DrawerButton < Platinum::Base
  include Phlex::Rails::Helpers::ClassNames

  def initialize caption: nil, position: "bottom", hidden: false
    @caption = caption
    @position = position
    @hidden = hidden
  end

  def view_template(&)
    div(class: class_names("p-4" => true, "hidden" => @hidden), data: {controller: "drawer", drawer_position_value: @position, drawer_backdrop_value: theme.drawer_backdrop, drawer_contents_value: theme.drawer_background}) do
      button(class: theme.button, data: {action: "drawer#open"}) { render_caption }
      div(class: "hidden", data: {drawer_target: "contents"}, &)
    end
  end

  private def render_caption = @caption.respond_to?(:call) ? @caption.call : @caption.to_s
end
