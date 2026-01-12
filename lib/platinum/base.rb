# frozen_string_literal: true

class Platinum::Base < Phlex::HTML
  extend Literal::Properties

  def page = Page.current
  def theme = Theme.current

  private def default_url_options = Rails.application.config.action_controller.default_url_options

  class << self
    def Enum(*values) = proc { |v| values.include? v }
    def Size = Enum(*SIZES)
    def Colour = Enum(*COLOURS)
    def Shade = Enum(50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950)

    SIZES = %w[none xs sm md lg xl auto full min max fit svh svw].freeze
    COLOURS = %w[red orange amber yellow lime green emerald teal cyan sky blue indigo violet purple fuchsia pink rose slate gray zinc neutral stone].freeze
  end
end
