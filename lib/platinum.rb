# frozen_string_literal: true

module Platinum
  extend Phlex::Kit
  require_relative "platinum/version"
  require_relative "platinum/theme"
  require_relative "platinum/base"
  require_relative "platinum/slotted"
  require_relative "platinum/icon"
  require_relative "platinum/flex"
  require_relative "platinum/row"
  require_relative "platinum/column"
  require_relative "platinum/breadcrumb"
  require_relative "platinum/h"
  require_relative "platinum/page"

  class Error < StandardError; end
end
