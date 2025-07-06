# frozen_string_literal: true

class Platinum::Base < Phlex::HTML
  def page = Page.current

  def theme = Theme.current
end
