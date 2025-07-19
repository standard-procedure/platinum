# frozen_string_literal: true

class Platinum::Base < Phlex::HTML
  def page = Page.current

  def theme = Theme.current

  private def default_url_options = Rails.application.config.action_controller.default_url_options
end
