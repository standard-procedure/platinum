# frozen_string_literal: true

class Platinum::Theme
  def initialize config: {}
    @config = DEFAULT_CONFIG.merge(config)
  end

  class << self
    def current
      @current ||= new
    end

    attr_writer :current
  end

  DEFAULT_CONFIG = {
    home_icon: "house",
    navigation_icon: "three-dots-vertical",
    filters_icon: "filter",
    toolbars_icon: "caret-right-square",
    expander_icon: "plus-circle",
    breadcrumb_icon: "chevron-compact-right",
    body: "font-light text-stone-800 bg-stone-50 dark:text-stone-200 dark:bg-stone-900",
    muted: "text-stone-600 dark:text-stone-400",
    panel: "py-1 px-2 border rounded-md bg-stone-200/80 border-white hover:bg-stone-200 dark:bg-stone-800/80 dark:border-black dark:hover:bg-stone-800",
    input: "px-4 py-2 mt-2 mx-1 block w-full rounded-md border border-stone-100 bg-stone-50 text-stone-800 focus-visible:border-green-200 focus:bg-white dark:border-stone-800 dark:bg-stone-600 dark:text-stone-200 dark:focus-visible:border-green-800 dark:focus:bg-black",
    button: "px-2 py-1 font-light backdrop-blur-lg border rounded-md text-stone-600 bg-stone-100/10 border-stone-800 hover:text-stone-100 hover:bg-stone-800/80 hover:border-stone-900 dark:text-stone-400 dark:bg-stone-700/10 dark:border-stone-400 dark:hover:text-stone-800 dark:hover:bg-stone-200/80 dark:hover:border-stone-200 hover:animate-pulse",
    border: "border rounded-md border-stone-800 hover:border-stone-900 dark:border-stone-500 dark:hover:border-stone-500",
    primary: "font-medium text-green-800 dark:text-green-200",
    primary_button: "px-2 py-1 font-medium border rounded-md text-green-100 bg-green-600 border-green-700 hover:text-green-900 hover:bg-green-300 hover:border-green-700 dark:bg-green-400 dark:text-green-900 dark:border-green-300 dark:hover:bg-green-700 dark:hover:text-green-400 dark:hover:border-green-300 hover:animate-pulse",
    primary_border: "border rounded-md border-green-800 hover:border-green-900 dark:border-green-200 dark:hover:border-green-800",
    success: "font-medium text-green-800 dark:text-green-200",
    success_button: "px-2 py-1 font-medium border rounded-md text-green-600 bg-green-100 border-green-600 hover:text-green-800 hover:bg-green-300 hover:border-green-900 dark:bg-green-900 dark:text-green-400 dark:border-green-400 dark:hover:bg-green-700 dark:hover:text-green-200 dark:hover:border-green-100 hover:animate-pulse",
    success_border: "border rounded-md border-green-800 hover:border-green-900 dark:border-green-200 dark:hover:border-green-800",
    warning_body: "font-light text-amber-500 dark:text-amber-400",
    warning_button: "px-2 py-1 font-medium border rounded-md text-amber-600 bg-amber-100 border-amber-600 hover:text-amber-800 hover:bg-amber-300 hover:border-amber-900 dark:text-amber-400 dark:bg-amber-900 dark:border-amber-400 dark:hover:text-amber-200 dark:hover:bg-amber-700 dark:hover:border-amber-100 hover:animate-pulse",
    warning_border: "border rounded-md border-amber-600 hover:border-amber-900 dark:border-amber-400 dark:hover:border-amber-100",
    danger: "font-medium text-red-800 dark:text-red-200",
    danger_button: "font-medium border rounded-md px-4 py-1 text-red-600 bg-red-100 border-red-600 hover:text-red-50 hover:bg-red-500 hover:border-red-900 dark:bg-red-600 dark:text-red-200 dark:border-red-900 dark:hover:bg-red-400 dark:hover:text-red-50 dark:hover:border-red-100 hover:animate-pulse",
    danger_border: "border rounded-md border-red-800 hover:border-red-900 dark:border-red-200 dark:hover:border-red-100",
    nav_button: "text-sm font-light border rounded-full px-4 py-1 border-stone-400 text-stone-700 bg-stone-100 hover:border-green-600 hover:text-green-900 hover:bg-green-300 dark:border-stone-300 dark:text-stone-300 dark:bg-stone-700 dark:hover:border-green-400 dark:hover:text-green-100 dark:hover:bg-green-700 hover:animate-pulse",
    selected_nav_button: "text-sm font-light border rounded-full px-4 py-1 border-green-400 text-green-700 bg-green-100 hover:border-green-600 hover:text-green-900 hover:bg-green-300 dark:border-green-300 dark:text-green-300 dark:bg-green-700 dark:hover:border-green-400 dark:hover:text-green-100 dark:hover:bg-green-700 hover:animate-pulse",
    info_body: "font-light rounded-md px-2 py-1 text-stone-800 bg-yellow-200 dark:text-stone-400 dark:bg-yellow-800",
    info_button: "font-medium border rounded-md text-stone-800 bg-yellow-200 border-yellow-500 hover:text-yellow-100 hover:bg-yellow-800 hover:border-yellow-800 dark:text-stone-200 dark:bg-yellow-800 dark:border-yellow-500 dark:hover:text-yellow-900 dark:hover:bg-yellow-500 dark:hover:border-yellow-200",
    info_border: "border rounded-md border-yellow-600 hover:border-yellow-900 dark:border-yellow-400 dark:hover:border-yellow-100",
    link: "rounded-md px-1 font-medium border-b text-green-800 border-green-100 hover:border-green-200 hover:text-green-700 hover:bg-green-100 dark:text-green-200 dark:border-green-900 dark:hover:text-green-300 dark:hover:bg-green-900 dark:hover:border-green-800 hover:animate-pulse",
    overlay: "border rounded-md backdrop-blur-lg bg-stone-200/10 border-stone-200 hover:bg-stone-50/30 dark:bg-stone-900/10 dark:border-stone-900 dark:hover:bg-stone-900/30",
    h: {1 => "text-2xl font-bold", 2 => "text-xl font-medium border-b border-stone-600 dark:border-stone-300", 3 => "text-xk font-bold", 4 => "text-lg font-bold", 5 => "text-base font-bold", 6 => "text-sm font-bold"},
    expander: "border rounded-md p-1 backdrop-blur-lg bg-stone-200/10 border-white hover:bg-stone-50/80 dark:bg-stone-800/10 dark:border-black dark:hover:bg-stone-900/80 open:bg-stone-100/80 open:border-stone-200 open:hover:bg-stone-50 open:dark:bg-stone-800 open:dark:border-stone-600 open:dark:hover:bg-stone-900",
    expander_summary: "z-1 shrink-0 transition duration-500 rounded-xl px-4 py-1 group-open:rotate-90 group-open:border group-open:border-stone-300 group-open:bg-white group-open:text-stone-600 hover:group-open:border-stone-600 hover:group-open:bg-stone-100 hover:group-open:text-stone-800",
    pagination_inner: %w[text-base backdrop-blur-xs px-2 mx-2 rounded-lg border text-stone-100 bg-stone-400/30 border-stone-50 dark:text-stone-900 dark:bg-stone-600/30 dark:border-stone-900],
    pagination_text: %w[text-sm rounded-lg px-4 py-1 backdrop-blur-xs border text-stone-700 border-stone-50 bg-stone-50/30 hover:bg-stone-100 dark:text-stone-300 dark:border-stone-900 dark:bg-stone-900/30 hover:dark:bg-stone-800]
  }.freeze

  DEFAULT_CONFIG.keys.each do |key|
    define_method(key) { @config[key] }
  end
end
