# frozen_string_literal: true

class Platinum::Theme
  def initialize config: {}
    @config = DEFAULT_CONFIG.merge(config).freeze
  end
  attr_reader :config

  class << self
    def current = Thread.current[:platinum_theme]

    def load config = {}
      Thread.current[:platinum_theme] = Platinum::Theme.new(config: config)
    end
  end

  DEFAULT_CONFIG = {
    home_icon: "house",
    navigation_icon: "three-dots-vertical",
    filters_icon: "filter",
    toolbars_icon: "caret-right-square",
    expander_icon: "plus-circle",
    breadcrumb_icon: "chevron-compact-right",
    body: %w[flex flex-row justify-between items-stretch font-light text-base bg-white text-neutral-700 dark:bg-black dark:text-neutral-300],
    sidebar_container: %w[shrink-0 h-svh flex flex-col justify-between items-stretch pt-12 md:pt-24 pb-12 border-r border-neutral-300 dark:border-neutral-600],
    sidebar_separator: %w[px-2 py-1 border-t border-neutral-300 dark:border-neutral-600],
    main: %w[flex-1 flex flex-col justify-start items-stretch pt-12 md:pt-24 pb-12],
    header: %w[fixed inset-x-0 top-0 z-10 backdrop-blur-lg border-b border-white bg-white/10 text-neutral-900 hover:border-neutral-100 hover:bg-white/50 hover:text-neutral-600 dark:border-black dark:bg-black/10 dark:text-neutral-200 dark:hover:border-neutral-900 dark:hover:bg-black/50 dark:hover:text-neutral-400],
    footer: %w[fixed inset-x-0 bottom-0 z-20 backdrop-blur-lg border-t border-white bg-white/10 text-neutral-800 hover:border-neutral-100 hover:bg-white/50 hover:text-neutral-600 dark:border-black dark:bg-black/10 dark:text-neutral-200 dark:hover:border-neutral-900 dark:hover:bg-black/50 dark:hover:text-neutral-400],
    mobile_nav: %w[flex md:hidden items-center justify-between px-1 py-2 h-10 gap-1],
    desktop_nav: %w[hidden md:flex items-center justify-start px-4 h-12 gap-2],
    desktop_header_row: %w[hidden md:flex h-10 px-4 backdrop-blur-lg bg-neutral-50/10 dark:bg-neutral-900/10],
    toolbar_container: %w[flex flex-col overflow-y-auto md:flex-row md:overflow-x-auto flex-nowrap gap-1 p-1 items-stretch justify-start md:items-center ms:justify-start rounded-lg backdrop-blur-lg border border-neutral-50 bg-white/30 text-neutral-800 dark:border-neutral-900 dark:bg-black/30 dark:text-neutral-200],
    button: "px-2 py-1 block w-full md:w-auto font-light backdrop-blur-lg border rounded-md text-neutral-600 bg-neutral-100/10 border-neutral-300 hover:text-neutral-100 hover:bg-neutral-800/80 hover:border-neutral-600 dark:text-neutral-400 dark:bg-neutral-700/10 dark:border-neutral-700 dark:hover:text-neutral-400 dark:hover:bg-neutral-600/80 dark:hover:border-neutral-400 hover:animate-pulse",
    border: "border rounded-md border-neutral-800 hover:border-neutral-900 dark:border-neutral-500 dark:hover:border-neutral-500",
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
    info_body: "font-light rounded-md px-2 py-1 text-neutral-800 bg-yellow-200 dark:text-neutral-400 dark:bg-yellow-800",
    info_button: "font-medium border rounded-md text-neutral-800 bg-yellow-200 border-yellow-500 hover:text-yellow-100 hover:bg-yellow-800 hover:border-yellow-800 dark:text-neutral-200 dark:bg-yellow-800 dark:border-yellow-500 dark:hover:text-yellow-900 dark:hover:bg-yellow-500 dark:hover:border-yellow-200",
    info_border: "border rounded-md border-yellow-600 hover:border-yellow-900 dark:border-yellow-400 dark:hover:border-yellow-100",
    link: "rounded-sm block p-1 font-medium text-underline hover:animate-pulse text-green-800 hover:text-green-700 hover:bg-green-100 dark:text-green-200 dark:hover:text-green-300 dark:hover:bg-green-900",
    link_active: "rounded-sm block p-1 font-medium text-underline hover:animate-pulse text-green-800 bg-green-100 hover:text-green-900 hover:bg-green-100 dark:text-green-200 dark:bg-green-800 dark:hover:text-green-100 dark:hover:bg-green-700",
    h: {1 => "text-2xl font-bold", 2 => "text-xl font-medium border-b border-neutral-600 dark:border-neutral-300", 3 => "text-xl font-bold", 4 => "text-lg font-bold", 5 => "text-base font-bold", 6 => "text-sm font-bold"},
    filter_container: %w[flex flex-col overflow-y-auto md:flex-row md:overflow-x-auto flex-nowrap items-stretch justify-start md:items-center ms:justify-start gap-1 rounded-lg backdrop-blur-lg border-neutral-50 bg-neutral-200/10 text-neutral-300 hover:border-white hover:bg-neutral-300 hover:text-neutral-800 dark:border-neutral-900 dark:bg-neutral-800/10 dark:text-neutral-700 dark:hover:border-black dark:hover:bg-neutral-700 dark:hover:text-neutral-800],
    filter_link: "px-2 py-1 block w-full md:w-auto text-sm font-light backdrop-blur-lg rounded-md text-neutral-600 bg-neutral-100/10 border-neutral-300 hover:text-neutral-100 hover:bg-neutral-800/80 hover:border-neutral-600 dark:text-neutral-400 dark:bg-neutral-700/10 dark:border-neutral-700 dark:hover:text-neutral-400 dark:hover:bg-neutral-600/80 dark:hover:border-neutral-400 hover:animate-pulse",
    selected_filter_link: "px-2 py-1 block w-full md:w-auto font-light backdrop-blur-lg rounded-md text-green-600 bg-green-300/10 border-green-300 hover:text-green-100 hover:bg-green-800/80 hover:border-green-600 dark:text-green-400 dark:bg-green-700/10 dark:border-green-700 dark:hover:text-green-400 dark:hover:bg-green-600/80 dark:hover:border-green-400 hover:animate-pulse",
    row: %w[flex flex-row items-center justify-start flex-nowrap],
    wrapped_row: %w[flex flex-row items-center justify-start flex-wrap],
    scrolling_row: %w[flex flex-row items-center justify-start flex-nowrap overflow-x-auto],
    column: %w[flex flex-col items-stretch justify-start flex-nowrap],
    wrapped_column: %w[flex flex-col items-stretch justify-start flex-wrap],
    scrolling_column: %w[flex flex-col items-center justify-start flex-nowrap overflow-y-auto],
    card_outer: %w[block m-1 p-1 md:p-2 rounded-lg border border-neutral-200 bg-neutral-100 dark:border-neutral-700 dark:bg-neutral-800/30],
    card_inner: %w[p-1 block md:flex md:justify-between md:gap-4 rounded-lg border border-white bg-neutral-100 hover:bg-white hover:border-neutral-200 dark:border-black dark:bg-neutral-800 dark:hover:bg-black dark:hover:border-neutral-700],
    drawer_backdrop: %w[fixed inset-0 backdrop-blur-lg z-40 opacity-0 pointer-events-none transition-opacity duration-300 bg-neutral-700/10 dark:bg-neutral-300/10],
    drawer_background: %w[fixed z-50 overflow-hidden transition-transform duration-300 ease-out py-4 px-4 backdrop-blur-lg rounded-sm border border-neutral-50 bg-white/30 md:bg-neutral-100/30 dark:border-neutral-800 dark:bg-black/30 md:dark:bg-neutral-700/30],
    inset_button: %w[rounded-md px-2 py-1 backdrop-blur-xs text-neutral-400 bg-neutral-200/30 hover:bg-green-100 hover:text-green-700 dark:text-neutral-600 dark:bg-neutral-800/30 dark:hover:bg-green-900 dark:hover:text-green-300],
    inset_danger_button: %w[rounded-md px-2 py-1 backdrop-blur-xs text-neutral-400 bg-neutral-200/30 hover:bg-red-100 hover:text-red-700 dark:text-neutral-600 dark:bg-neutral-800/30 dark:hover:bg-red-900 dark:hover:text-red-300],
    info_alert_title_frame: %w[fixed top-14 left-1 right-1 md:top-26 md:left-auto md:right-8 min-w-sm w-auto md:min-w-xl font-medium rounded-lg backdrop-blur-lg p-4 mx-2 my-4 transition-transform scale-0 open:scale-100 duration-2000 border border-green-500 bg-green-100/30 text-green-700 dark:bg-green-900/30 dark:text-green-300],
    success_alert_title_frame: %w[fixed top-14 left-1 right-1 md:top-26 md:left-auto md:right-8 min-w-sm w-auto md:min-w-xl font-medium rounded-lg backdrop-blur-lg p-4 mx-2 my-4 transition-transform scale-0 open:scale-100 duration-2000 border border-green-700 bg-green-300/30 text-green-700 dark:border-green-300 dark:bg-green-700/30 dark:text-green-300],
    warning_alert_title_frame: %w[fixed top-14 left-1 right-1 md:top-26 md:left-auto md:right-8 min-w-sm w-auto md:min-w-xl font-medium rounded-lg backdrop-blur-lg p-4 mx-2 my-4 transition-transform scale-0 open:scale-100 duration-2000 border border-orange-700 bg-orange-300/30 text-orange-700 dark:border-orange-300 dark:bg-orange-700/30 dark:text-orange-300],
    danger_alert_title_frame: %w[fixed top-14 left-1 right-1 md:top-26 md:left-auto md:right-8 min-w-sm w-auto md:min-w-xl font-medium rounded-lg backdrop-blur-lg p-4 mx-2 my-4 transition-transform scale-0 open:scale-100 duration-2000 border border-red-700 bg-red-300/30 text-red-700 dark:border-red-300 dark:bg-red-700/30 dark:text-red-300],
    badge_frame: %w[inline rounded-full px-3 py-1 border text-sm whitespace-nowrap],
    badge: %w[bg-neutral-50 text-neutral-800 hover:bg-neutral-200 hover:text-neutral-700 dark:bg-neutral-900 dark:text-neutral-200 dark:hover:bg-neutral-800 dark:hover:text-neutral-300],
    muted: "text-neutral-600 dark:text-neutral-400",
    panel: "py-1 px-2 rounded-lg bg-neutral-200/80 hover:bg-neutral-200 dark:bg-neutral-800/80 dark:hover:bg-neutral-800",
    input: "py-1 px-2 block w-full rounded-md border border-neutral-300 bg-white text-neutral-800 focus:border-green-200 focus-within:border-green-200 focus-visible:border-green-200 dark:border-neutral-700 dark:bg-black dark:text-neutral-200 dark:focus-visible:border-green-800",
    expander: "border rounded-md p-1 backdrop-blur-lg bg-neutral-200/10 border-white hover:bg-neutral-50/80 dark:bg-neutral-800/10 dark:border-black dark:hover:bg-neutral-900/80 open:bg-neutral-100/80 open:border-neutral-200 open:hover:bg-neutral-50 open:dark:bg-neutral-800 open:dark:border-neutral-600 open:dark:hover:bg-neutral-900",
    expander_summary: "z-1 shrink-0 transition duration-500 rounded-xl px-4 py-1 group-open:rotate-90 group-open:border group-open:border-neutral-300 group-open:bg-white group-open:text-neutral-600 hover:group-open:border-neutral-600 hover:group-open:bg-neutral-100 hover:group-open:text-neutral-800",
    pagination_inner: %w[text-base backdrop-blur-xs px-2 mx-2 rounded-lg border text-neutral-100 bg-neutral-400/30 border-neutral-50 dark:text-neutral-900 dark:bg-neutral-600/30 dark:border-neutral-900],
    pagination_text: %w[text-sm rounded-lg px-4 py-1 backdrop-blur-xs border text-neutral-700 border-neutral-50 bg-neutral-50/30 hover:bg-neutral-100 dark:text-neutral-300 dark:border-neutral-900 dark:bg-neutral-900/30 hover:dark:bg-neutral-800],
    pagination_link: %w[text-sm rounded-lg px-4 py-1 backdrop-blur-xs border text-neutral-700 border-neutral-50 bg-neutral-50/30 hover:bg-neutral-100 dark:text-neutral-300 dark:border-neutral-900 dark:bg-neutral-900/30 hover:dark:bg-neutral-800],
    list: %w[text-sm bg-neutral-100 *:even:bg-neutral-50 dark:bg-neutral-900 *:even:dark:bg-neutral-800],
    list_item: %w[p-1 border-b border-neutral-200 dark:border-neutral-800]
  }.freeze

  DEFAULT_CONFIG.keys.each do |key|
    define_method(key) { @config[key] }
  end
end
