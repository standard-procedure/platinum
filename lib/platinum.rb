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
  require_relative "platinum/expander"
  require_relative "platinum/pagination"
  require_relative "platinum/card"
  require_relative "platinum/scroll"
  require_relative "platinum/alert"
  require_relative "platinum/flash"
  require_relative "platinum/back_link"
  require_relative "platinum/badge"
  require_relative "platinum/a"
  require_relative "platinum/button"
  require_relative "platinum/copy_text_field"
  require_relative "platinum/details_list"
  require_relative "platinum/list"
  require_relative "platinum/rich_text_viewer"
  require_relative "platinum/form"
  require_relative "platinum/search"
  require_relative "platinum/password_field"
  require_relative "platinum/submit"
  require_relative "platinum/drawer_button"
  require_relative "platinum/page"

  class Error < StandardError; end
end
