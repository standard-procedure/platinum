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
    toolbars_icon: "gear",
    body: "font-light text-slate-800 bg-slate-50 dark:text-slate-200 dark:bg-slate-900",
    muted: "text-slate-600 dark:text-slate-400",
    panel: "py-1 px-2 border rounded-md bg-slate-200/80 border-white hover:bg-slate-200 dark:bg-slate-800/80 dark:border-black dark:hover:bg-slate-800",
    button: "font-medium backdrop-blur-lg border rounded-md text-slate-600 bg-slate-100/10 border-slate-800 hover:text-slate-800 hover:bg-slate-200/80 hover:border-slate-900 dark:text-slate-400 dark:bg-slate-900/10 dark:border-slate-500 dark:hover:text-slate-200 dark:hover:bg-slate-800/80 dark:hover:border-slate-500",
    border: "border rounded-md border-slate-800 hover:border-slate-900 dark:border-slate-500 dark:hover:border-slate-500",
    primary: "font-medium text-sky-800 dark:text-sky-200",
    primay_button: "font-medium border rounded-md text-sky-100 bg-sky-800 border-sky-900 hover:text-sky-800 hover:bg-sky-300 hover:border-sky-900 hover:border-sky-900 dark:bg-sky-500 dark:text-sky-600 dark:border-sky-200 dark:hover:bg-sky-400 dark:hover:text-sky-900 dark:hover:border-sky-800",
    primary_border: "border rounded-md border-sky-800 hover:border-sky-900 dark:border-sky-200 dark:hover:border-sky-800",
    secondary_body: "font-light text-slate-500 dark:text-slate-400",
    secondary_button: "font-medium border rounded-md text-slate-500 bg-slate-50 border-slate-500 hover:text-slate-50 hover:bg-slate-500 hover:border-slate-600 dark:text-slate-500 dark:bg-slate-800 dark:border-slate-400 dark:hover:text-slate-900 dark:hover:bg-slate-500 dark:hover:border-slate-600",
    secondary_border: "border rounded-md border-slate-600 hover:border-slate-900 dark:border-slate-400 dark:hover:border-slate-100",
    success: "font-medium text-green-800 dark:text-green-200",
    success_button: "font-medium border rounded-md text-green-100 bg-green-800 border-green-900 hover:text-green-800 hover:bg-green-300 hover:border-green-900 hover:border-green-900 dark:bg-green-500 dark:text-green-600 dark:border-green-200 dark:hover:bg-green-400 dark:hover:text-green-900 dark:hover:border-green-800",
    success_border: "border rounded-md border-green-800 hover:border-green-900 dark:border-green-200 dark:hover:border-green-800",
    warning_body: "font-light text-amber-500 dark:text-amber-400",
    warning_button: "font-medium border rounded-md text-amber-500 bg-amber-50 border-amber-500 hover:text-amber-50 hover:bg-amber-500 hover:border-amber-600 dark:text-amber-500 dark:bg-amber-800 dark:border-amber-400 dark:hover:text-amber-900 dark:hover:bg-amber-500 dark:hover:border-amber-600",
    warning_border: "border rounded-md border-amber-600 hover:border-amber-900 dark:border-amber-400 dark:hover:border-amber-100",
    danger: "font-medium text-red-800 dark:text-red-200",
    danger_button: "font-medium border rounded-md text-red-100 bg-red-800 border-red-900 hover:text-red-800 hover:bg-red-300 hover:border-red-900 hover:border-red-900 dark:bg-red-500 dark:text-red-600 dark:border-red-200 dark:hover:bg-red-400 dark:hover:text-red-900 dark:hover:border-red-800",
    danger_border: "border rounded-md border-red-800 hover:border-red-900 dark:border-red-200 dark:hover:border-red-800",
    info_body: "font-light rounded-md px-2 py-1 text-slate-800 bg-yellow-200 dark:text-slate-400 dark:bg-yellow-800",
    info_button: "font-medium border rounded-md text-slate-800 bg-yellow-200 border-yellow-500 hover:text-yellow-100 hover:bg-yellow-800 hover:border-yellow-800 dark:text-slate-200 dark:bg-yellow-800 dark:border-yellow-500 dark:hover:text-yellow-900 dark:hover:bg-yellow-500 dark:hover:border-yellow-200",
    info_border: "border rounded-md border-yellow-600 hover:border-yellow-900 dark:border-yellow-400 dark:hover:border-yellow-100",
    link: "rounded-md p-1 font-medium border-b text-sky-800 border-sky-200 hover:text-sky-200 hover:bg-sky-800 dark:text-sky-200 dark:border-sky-800 dark:hover:text-sky-200 dark:hover:border-sky-200",
    overlay: "border rounded-md backdrop-blur-lg bg-slate-200/10 border-white hover:bg-slate-50/80 dark:bg-slate-900/10 dark:border-black dark:hover:bg-slate-900/80",
    h: {1 => "text-2xl font-bold", 2 => "text-xl font-medium border-b border-slate-600 dark:border-slate-300", 3 => "text-xk font-bold", 4 => "text-lg font-bold", 5 => "text-base font-bold", 6 => "text-sm font-bold"}
  }.freeze

  DEFAULT_CONFIG.keys.each do |key|
    define_method(key) { @config[key] }
  end
end
