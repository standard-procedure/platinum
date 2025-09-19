# frozen_string_literal: true

class Platinum::Alert < Platinum::Base
  def initialize style = :info, title:, icon: nil, message: "", **attributes
    style = ICONS.key?(style.to_sym) ? style.to_sym : :info
    @icon = icon || ICONS[style]
    @title = title.to_s
    @title_frame_css = TITLE_FRAME_CSS[style].call
    @message = message
    @data = attributes.delete(:data) || {}
    @data[:controller] = ["delayed-close", @data.delete(:controller)].join(" ")
    @attributes = attributes
  end

  def render? = @title.present?

  def view_template(&)
    div(**mix(role: "alert", open: true, id: "alert", class: @title_frame_css, data: @data, **@attributes)) do
      div do
        strong { Icon(@icon, text: @title) }
        p(class: "mt-2 font-light") { @message.to_s }
      end
    end
  end

  ICONS = {
    info: "info-circle",
    notice: "info-circle",
    success: "check-circle",
    warning: "exclamation-circle",
    alert: "exclamation-circle",
    danger: "exclamation-triangle-fill"
  }.freeze
  TITLE_FRAME_CSS = {
    info: -> { Platinum::Theme.current.info_alert_title_frame },
    notice: -> { Platinum::Theme.current.info_alert_title_frame },
    success: -> { Platinum::Theme.current.success_alert_title_frame },
    warning: -> { Platinum::Theme.current.warning_alert_title_frame },
    alert: -> { Platinum::Theme.current.warning_alert_title_frame },
    danger: -> { Platinum::Theme.current.danger_alert_title_frame }
  }.freeze
end
