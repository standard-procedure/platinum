# frozen_string_literal: true

class Platinum::Theme
  def initialize config: {}
    @config = DEFAULT_CONFIG.merge(config).freeze
  end
  attr_reader :config

  class << self
    def current = Thread.current[:platinum_theme]

    def load config = {}
      Thread.current[:platinum_theme] = new(config: config)
    end
  end

  DEFAULT_CONFIG = {
    # standard icons
    home_icon: "house",
    navigation_icon: "three-dots-vertical",
    filters_icon: "filter",
    toolbars_icon: "caret-right-square",
    expander_icon: "plus-circle",
    breadcrumb_icon: "chevron-compact-right",
    show_password_icon: "eye",
    hide_password_icon: "eye-slash",
    search_icon: "search",
    clear_icon: "x-circle",
    filter_icon: "filter",
    add_icon: "plus-square",
    toolbar_icon: "gear",
    edit_icon: "pencil-square",
    delete_icon: "x-square-fill",
    cancel_icon: "arrow-left-circle",
    first_icon: "caret-left-square",
    previous_icon: "caret-left",
    next_icon: "caret-right",
    last_icon: "caret-right-square",
    copy_icon: "copy",
    # General classes that need to loaded
    general: %w[relative flow-root hidden block shrink-0 flex-1 text-wrap text-nowrap max-w-100 overflow-x-hidden overflow-x-auto overflow-y-hidden overflow-y-auto],
    # layout
    body: %w[py-safe max-w-svw flex flex-row justify-between items-stretch font-sans font-normal text-base] +
      %w[bg-sky-050 text-neutral-700 dark:bg-black dark:text-neutral-300],
    sidebar_container: %w[shrink-0 h-full min-h-svh md:w-1/4 md:max-w-sm md:overflow-x-hidden flex flex-col justify-stretch items-stretch pt-24 md:pt-12 pb-24 md:pb-14],
    sidebar_separator: %w[px-2 py-1 border-t] + %w[border-neutral-300 dark:border-neutral-600],
    main: %w[flex-1 flex flex-col justify-start items-stretch pt-24 pb-24 md:pt-14 md:pb-12 max-w-svw],
    header: %w[fixed inset-x-safe top-safe pt-12 px-4 md:pt-1 md:px-1 z-10 backdrop-blur-sm border-b] +
      %w[border-white bg-sky-900/90 text-sky-200 hover:border-sky-100 hover:bg-sky-900 hover:text-sky-100] +
      %w[dark:border-black dark:bg-sky-900/90 dark:text-sky-700 dark:hover:border-sky-800 dark:hover:bg-sky-200 dark:hover:text-sky-800],
    footer: %w[fixed pb-safe inset-x-safe bottom-safe px-4 md:pb-1 md:px-1 z-20 md:backdrop-blur-sm md:border-t] +
      %w[border-white bg-transparent text-neutral-800 hover:border-neutral-100 hover:bg-white/20 hover:text-neutral-900 dark:border-black dark:bg-transparent dark:text-neutral-200 dark:hover:border-neutral-900 dark:hover:bg-black/20 dark:hover:text-neutral-400],
    mobile_nav: %w[flex flex-no-wrap overflow-x-auto overflow-y-hidden md:hidden items-center justify-between px-1 py-2 h-12 gap-1],
    desktop_nav: %w[hidden md:flex items-center justify-start px-4 h-12 gap-2],
    toolbar_container: %w[flex flex-col overflow-hidden md:flex-row flex-nowrap text-nowrap gap-2 items-stretch justify-start md:items-center md:justify-start rounded-md backdrop-blur-lg border] +
      %w[border-white bg-sky-200/30 hover:bg-sky-200 text-sky-800] +
      %w[dark:border-black dark:bg-sky-800/30 dark:text-sky-200],
    filter_container: %w[flex flex-col overflow-hidden md:flex-row flex-nowrap items-stretch justify-start md:items-center ms:justify-start gap-1 rounded-md backdrop-blur-lg border] +
      %w[border-white bg-neutral-200/10 hover:bg-neutral-200 text-neutral-800] +
      %w[dark:border-black dark:bg-neutral-800/30 dark:text-neutral-200],
    filter_link: %w[px-2 py-1 block w-full md:w-auto text-sm font-light text-nowrap backdrop-blur-lg rounded-md] +
      %w[text-neutral-600 bg-neutral-100/10 border-neutral-300 hover:text-neutral-100 hover:bg-neutral-800/80 hover:border-neutral-600 dark:text-neutral-400 dark:bg-neutral-700/10 dark:border-neutral-700 dark:hover:text-neutral-400 dark:hover:bg-neutral-600/80 dark:hover:border-neutral-400 hover:animate-pulse],
    selected_filter_link: %w[px-2 py-1 block w-full md:w-auto font-light backdrop-blur-lg rounded-md hover:animate-pulse] +
      %w[text-sky-600 bg-sky-300/10 border-sky-300 hover:text-sky-100 hover:bg-sky-800/80 hover:border-sky-600 dark:text-sky-400 dark:bg-sky-700/10 dark:border-sky-700 dark:hover:text-sky-400 dark:hover:bg-sky-600/80 dark:hover:border-sky-400],
    drawer_button: %w[px-4 py-1 block font-light backdrop-blur-lg hover:animate-pulse border rounded-full] +
      %w[text-sky-800 bg-sky-100/50 border-white hover:text-sky-900 hover:bg-sky-100 hover:border-sky-200] +
      %w[dark:text-sky-300 dark:bg-sky-800/50 dark:border-black dark:hover:text-sky-100 dark:hover:bg-sky-800 dark:hover:border-sky-800],
    drawer_backdrop: %w[fixed inset-safe backdrop-blur-sm z-40 opacity-0 pointer-events-none transition-opacity duration-300 bg-transparent dark:bg-transparent],
    drawer_background: %w[fixed z-50 max-w-9/10 overflow-hidden transition-transform duration-300 ease-out py-4 px-4 backdrop-blur-lg rounded-sm border] +
      %w[border-neutral-50 bg-neutral-200/30 md:bg-neutral-200 dark:border-neutral-800 dark:bg-neutral-800/30 md:dark:bg-neutral-800],
    pagination_container: %w[backdrop-blur-lg],
    search_container: %w[backdrop-blur-lg] +
      %w[bg-white/10 hover:bg-white dark:bg-black/10 dark:hover:bg-black],
    search_submit_button_container: %w[absolute inset-y-0 right-2 top-0 grid w-8 place-content-center],
    search_clear_button_container: %w[absolute inset-y-0 right-10 top-0 grid w-8 place-content-center],
    # containers
    row: %w[flex flex-row items-center justify-start flex-nowrap],
    wrapped_row: %w[flex flex-row items-center justify-start flex-wrap],
    scrolling_row: %w[flex flex-row items-center justify-start flex-nowrap overflow-x-auto],
    column: %w[flex flex-col items-stretch justify-start flex-nowrap],
    wrapped_column: %w[flex flex-col items-stretch justify-start flex-wrap],
    scrolling_column: %w[flex flex-col items-center justify-start flex-nowrap overflow-y-auto],
    card_outer: %w[block max-w-svw m-1 rounded-md border overflow-hidden] +
      %w[border-sky-800] +
      %w[dark:border-neutral-950],
    card_inner: %w[p-1 md:p-2 block md:flex md:justify-between md:gap-4 rounded-md border] +
      %w[border-white bg-white hover:border-sky-200] +
      %w[dark:border-black dark:bg-black dark:hover:border-sky-700],
    badge_frame: %w[inline rounded-full px-3 py-1 border text-sm whitespace-nowrap],
    badge: %w[bg-neutral-50 text-neutral-800 hover:bg-neutral-200 hover:text-neutral-700 dark:bg-neutral-900 dark:text-neutral-200 dark:hover:bg-neutral-600 dark:hover:text-neutral-300],
    info_badge: %w[bg-sky-200 text-neutral-800 hover:bg-sky-200 hover:text-neutral-700 dark:bg-sky-900 dark:text-neutral-200 dark:hover:bg-sky-600 dark:hover:text-neutral-300],
    primary_badge: %w[bg-sky-800 text-neutral-100 hover:bg-sky-900 hover:text-sky-200 dark:bg-neutral-900 dark:text-sky-200 dark:hover:bg-sky-600 dark:hover:text-sky-300],
    success_badge: %w[bg-green-200 text-green-800 hover:bg-green-400 hover:text-green-900 dark:bg-green-900 dark:text-green-200 dark:hover:bg-green-600 dark:hover:text-green-300],
    warning_badge: %w[bg-orange-200 text-orange-800 hover:bg-orange-400 hover:text-orange-900 dark:bg-orange-900 dark:text-orange-200 dark:hover:bg-orange-600 dark:hover:text-orange-300],
    danger_badge: %w[bg-red-200 text-red-800 hover:bg-red-400 hover:text-red-900 dark:bg-red-900 dark:text-red-200 dark:hover:bg-red-600 dark:hover:text-red-300],

    list: %w[p-2 rounded-md] +
      %w[bg-neutral-100 *:even:bg-neutral-50 dark:bg-neutral-900 *:even:dark:bg-neutral-800],
    list_item: %w[rounded-md p-1] +
      %w[rounded-sm hover:bg-sky-100 hover:dark:bg-sky-900],
    # accents
    primary: %w[font-light text-sky-600 dark:text-sky-400],
    primary_border: %w[border rounded-md border-sky-600 hover:border-sky-700 dark:border-sky-400 dark:hover:border-sky-300],
    success: %w[font-medium text-green-800 dark:text-green-200],
    success_border: %w[border rounded-md border-sky-800 hover:border-sky-900 dark:border-sky-200 dark:hover:border-sky-100],
    warning_body: %w[font-light text-amber-500 dark:text-amber-500],
    warning_border: %w[border rounded-md border-amber-500 hover:border-amber-600 dark:border-amber-500 dark:hover:border-amber-400],
    danger: %w[font-medium text-red-800 dark:text-red-200],
    danger_border: %w[border rounded-md border-red-800 hover:border-red-900 dark:border-red-200 dark:hover:border-red-100],
    info_body: %w[font-light rounded-md px-2 py-1 text-neutral-800 bg-neutral-50 dark:text-neutral-400 dark:bg-neutral-900],
    info_border: %w[border rounded-md border-yellow-600 hover:border-yellow-700 dark:border-yellow-400 dark:hover:border-yellow-300],
    # typography
    h: {1 => %w[text-2xl], 2 => %w[text-xl border-b border-neutral-300 dark:border-neutral-700], 3 => %w[text-xl], 4 => %w[text-lg], 5 => %w[text-base font-bold], 6 => %w[text-sm font-bold]},
    muted: %w[font-thin text-sm text-neutral-500 dark:text-neutral-500],
    # forms
    form: %w[max-w-sm md:max-w-md lg:max-w-lg],
    label: %w[w-full max-w-sm md:max-w-md lg:max-w-lg px-3 py-2 rounded-none bg-neutral-50 text-neutral-600 dark:bg-neutral-900 dark:text-neutral-400],
    required_label: %w[w-full max-w-sm md:max-w-md lg:max-w-lg px-3 py-2 rounded-none border-t border-green-600 bg-green-50 text-neutral-600 dark:border-green-400 dark:bg-green-950 dark:text-neutral-200],
    inline_label: %w[w-auto max-w-9/10 overflow-hidden rounded-none basis-xs font-bold bg-white text-neutral-600 dark:bg-black dark:text-neutral-400],
    input: %w[w-full max-w-sm md:max-w-md lg:max-w-lg px-3 py-2 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-1 border border-neutral-300 bg-white text-neutral-800 placeholder-neutral-300 focus:ring-sky-500 disabled:bg-neutral-50 disabled:text-neutral-500 dark:border-neutral-600 dark:bg-sky-950 dark:text-neutral-200 dark:placeholder-sky-900 dark:focus:ring-sky-600 dark:disabled:bg-neutral-900 dark:disabled:text-neutral-500],
    inline_input: %w[rounded-md focus:outline-none focus:ring-2 focus:ring-offset-1 border border-neutral-300 bg-white text-neutral-800 placeholder-neutral-500 focus:ring-green-500 disabled:bg-neutral-50 disabled:text-neutral-500 dark:border-neutral-600 dark:bg-black dark:text-neutral-200 dark:placeholder-sky-900 dark:focus:ring-green-600 dark:disabled:bg-neutral-900 dark:disabled:text-neutral-500],
    inset_button: %w[rounded-md px-2 py-1 backdrop-blur-xs text-neutral-400 bg-neutral-200/30 hover:bg-sky-100 hover:text-sky-700 dark:text-neutral-600 dark:bg-neutral-800/30 dark:hover:bg-sky-900 dark:hover:text-sky-300],
    inset_danger_button: %w[rounded-md px-2 py-1 backdrop-blur-xs text-neutral-400 bg-neutral-200/30 hover:bg-red-100 hover:text-red-700 dark:text-neutral-600 dark:bg-neutral-800/30 dark:hover:bg-red-900 dark:hover:text-red-300],
    password_field_container: %w[relative w-full],
    password_field_button_container: %w[absolute inset-y-0 right-1 top-0 grid w-8 place-content-center bg-none rounded-md],
    copy_text_field_container: %w[flex flex-row justify-start gap-1 items-center w-full],
    copy_text_field_button_container: %w[grid w-8 place-content-center bg-none rounded-md],
    copy_text_field_button: %w[rounded-md px-2 py-1 text-neutral-400 bg-neutral-200/30 backdrop-blur-xs hover:bg-green-100 hover:text-green-700],
    signature_value: %w[rounded-lg border-neutral-500 bg-neutral-50 dark:bg-neutral-900],
    shadow_field: %w[rounded-lg text-neutral-100 dark:text-neutral-900],
    # buttons
    button: %w[pointer-events-auto px-4 py-1 block w-full md:w-auto font-medium backdrop-blur-lg hover:animate-pulse border rounded-md] +
      %w[text-neutral-500 bg-neutral-100/30 border-neutral-500/30 hover:text-neutral-900 hover:bg-sky-400 hover:border-sky-700] +
      %w[dark:text-neutral-500 dark:bg-neutral-800 dark:border-neutral-200/30 dark:hover:text-neutral-300 dark:hover:bg-sky-600 dark:hover:border-sky-300],
    primary_button: %w[pointer-events-auto px-4 py-1 block w-full md:w-auto font-medium backdrop-blur-lg hover:animate-pulse border rounded-md] +
      %w[text-sky-100 bg-sky-900/80 border-sky-900 hover:text-sky-400 hover:bg-sky-900 hover:border-sky-300] +
      %w[dark:text-sky-900 dark:bg-sky-100 dark:border-sky-100 dark:hover:text-sky-600 dark:hover:bg-sky-200 dark:hover:border-sky-700],
    success_button: %w[pointer-events-auto px-4 py-1 block w-full md:w-auto font-medium backdrop-blur-lg hover:animate-pulse border rounded-md] +
      %w[text-green-100 bg-green-900/80 border-green-900 hover:text-green-400 hover:bg-green-900 hover:border-green-300] +
      %w[dark:text-green-900 dark:bg-green-100 dark:border-green-100 dark:hover:text-green-600 dark:hover:bg-green-100 dark:hover:border-green-700],
    warning_button: %w[pointer-events-auto px-4 py-1 block w-full md:w-auto font-medium backdrop-blur-lg hover:animate-pulse border rounded-md] +
      %w[text-orange-100 bg-orange-900/80 border-orange-900 hover:text-orange-400 hover:bg-orange-900 hover:border-orange-300] +
      %w[dark:text-orange-900 dark:bg-orange-100/80 dark:border-orange-100 dark:hover:text-orange-600 dark:hover:bg-orange-100 dark:hover:border-orange-700],
    danger_button: %w[pointer-events-auto px-4 py-1 block w-full md:w-auto font-medium backdrop-blur-lg hover:animate-pulse border rounded-md] +
      %w[text-red-100 bg-red-900/80 border-red-900 hover:text-red-400 hover:bg-red-900 hover:border-red-300] +
      %w[dark:text-red-900 dark:bg-red-100/80 dark:border-red-100 dark:hover:text-red-600 dark:hover:bg-red-100 dark:hover:border-red-700],
    info_button: %w[pointer-events-auto px-4 py-1 block w-full md:w-auto font-light backdrop-blur-lg hover:animate-pulse border rounded-md] +
      %w[text-neutral-500 bg-neutral-100/30 border-neutral-500/30 hover:text-neutral-900 hover:bg-neutral-100 hover:border-neutral-700] +
      %w[dark:text-neutral-500 dark:bg-neutral-900/30 dark:border-neutral-500/30 dark:hover:text-neutral-100 dark:hover:bg-neutral-900 dark:hover:border-neutral-300],
    # links
    link: %w[rounded-sm block hover:animate-pulse underline decoration-dotted decoration-sky-400 dark:decoration-sky-800],
    link_active: %w[rounded-sm block hover:animate-pulse underline decoration-dotted text-sky-800 bg-sky-100 hover:text-sky-900 hover:bg-sky-200 dark:text-sky-200 dark:bg-sky-800 dark:hover:text-sky-100 dark:hover:bg-sky-700],
    # controls
    expander: %w[border rounded-md p-1 backdrop-blur-lg bg-neutral-200/10 border-white hover:bg-neutral-50/80 dark:bg-neutral-800/10 dark:border-black dark:hover:bg-neutral-900/80 open:bg-neutral-100/80 open:border-neutral-200 open:hover:bg-neutral-50 open:dark:bg-neutral-800 open:dark:border-neutral-600 open:dark:hover:bg-neutral-900],
    expander_summary: %w[rounded-md px-4 py-1 bg-neutral-100 dark:bg-neutral-900 hover:bg-neutral-200 hover:dark:bg-neutral-800 group-open:bg-sky-100 dark:group-open:bg-sky-900 group-open:hover:bg-sky-200 dark:group-open:hover:bg-sky-800 inset-shadow-sm inset-shadow-neutral-200 dark:inset-shadow-neutral-800 group-open:inset-shadow-neutral-400 dark:group-open:inset-shadow-neutral-600],
    pagination_inner: %w[overflow-x-auto text-xs shrink-0 font-light backdrop-blur-xs px-2 py-1 transition duration-500 rounded-full border text-neutral-100 bg-neutral-400/10 border-white dark:text-neutral-800 dark:bg-neutral-600/10 dark:border-black],
    pagination_text: %w[px-4 py-1 backdrop-blur-xs rounded-full border text-neutral-700 border-white bg-neutral-200 hover:text-neutral-800 hover:bg-white hover:border-neutral-200 dark:text-neutral-300 dark:border-black dark:bg-neutral-800 dark:hover:text-neutral-200 dark:hover:bg-black dark:hover:border-neutral-800],
    pagination_link: %w[px-4 py-1 backdrop-blur-xs rounded-full border text-neutral-700 border-white bg-neutral-50/10 hover:text-neutral-800 hover:bg-white hover:border-white dark:text-neutral-300 dark:border-black dark:bg-neutral-900/10 dark:hover:text-neutral-200 dark:hover:bg-black dark:hover:border-black],
    # alerts
    info_alert_title_frame: %w[z-10 fixed top-14 left-1 right-1 md:left-8 md:right-auto min-w-sm w-auto md:min-w-xl font-medium rounded-md backdrop-blur-lg p-4 mx-2 my-4 transition-transform scale-0 open:scale-100 duration-1000 border border-sky-500 bg-sky-100/30 text-sky-700 dark:bg-sky-900/30 dark:text-sky-300],
    success_alert_title_frame: %w[z-10 fixed top-14 left-1 right-1 md:left-8 md:right-auto min-w-sm w-auto md:min-w-xl font-medium rounded-md backdrop-blur-lg p-4 mx-2 my-4 transition-transform scale-0 open:scale-100 duration-1000 border border-sky-700 bg-sky-300/30 text-sky-700 dark:border-sky-300 dark:bg-sky-700/30 dark:text-sky-300],
    warning_alert_title_frame: %w[z-10 fixed top-14 left-1 right-1 md:left-8 md:right-auto min-w-sm w-auto md:min-w-xl font-medium rounded-md backdrop-blur-lg p-4 mx-2 my-4 transition-transform scale-0 open:scale-100 duration-1000 border border-orange-700 bg-orange-300/30 text-orange-700 dark:border-orange-300 dark:bg-orange-700/30 dark:text-orange-300],
    danger_alert_title_frame: %w[z-10 fixed top-14 left-1 right-1 md:left-8 md:right-auto min-w-sm w-auto md:min-w-xl font-medium rounded-md backdrop-blur-lg p-4 mx-2 my-4 transition-transform scale-0 open:scale-100 duration-1000 border border-red-700 bg-red-300/30 text-red-700 dark:border-red-300 dark:bg-red-700/30 dark:text-red-300],
    location_icon: %w[w-full max-w-sm md:max-w-md lg:max-w-lg rounded-full py-2 px-4 border border-indigo-500 bg-indigo-50 dark:bg-indigo-900 text-indigo-800 dark:text-indigo-200 hover:bg-indigo-300 hover:dark:bg-indigo-600 hover:animate-pulse],
    required_location_icon: %w[rounded-full py-2 px-4 border border-red-500 bg-red-50 dark:bg-red-900 text-red-800 dark:text-red-200 hover:bg-red-300 hover:dark:bg-red-600 hover:animate-pulse],
    selected_location_icon: %w[rounded-full py-2 px-4 border border-green-500 bg-green-50 dark:bg-green-900 text-green-800 dark:text-green-200 hover:bg-green-300 hover:dark:bg-green-600 hover:animate-pulse],
    dropzone: %w[dropzone p-6 text-center rounded-md border bg-neutral-100 hover:bg-indigo-100 border-indigo-200 hover:text-indigo-500 dark:bg-neutral-900 hover:dark:bg-indigo-900 dark:border-indigo-800 hover:dark:text-indigo-500],
    radio_button_label: %w[rounded-md px-4 py-1 mb-1 cursor-pointer bg-neutral-100 dark:bg-neutral-900 hover:bg-neutral-200 dark:hover:bg-neutral-800 active:bg-neutral-300 dark:active:bg-neutral-700 inset-shadow-sm inset-shadow-neutral-200 dark:inset-shadow-neutral-800 has-checked:inset-shadow-lg has-checked:inset-shadow-neutral-400 has-checked:bg-sky-100 dark:has-checked:inset-shadow-neutral-800 dark:has-checked:bg-sky-800],
    radio_button: %w[opacity-0 absolute],
    field_value: %w[w-full max-w-sm md:max-w-md lg:max-w-lg px-3 py-2 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-1 border border-neutral-300 bg-white text-neutral-800 placeholder-neutral-300 focus:ring-sky-500 disabled:bg-neutral-50 disabled:text-neutral-500 dark:border-neutral-600 dark:bg-sky-950 dark:text-neutral-200 dark:placeholder-sky-900 dark:focus:ring-sky-600 dark:disabled:bg-neutral-900 dark:disabled:text-neutral-500],
    reject_expander: %w[rounded-sm border border-red-200 bg-red-100 hover:bg-red-300 dark:border-red-800 dark:bg-red-900 dark:hover:bg-red-700],
    accept_expander: %w[rounded-sm border border-green-200 bg-green-100 hover:bg-green-300 dark:border-green-800 dark:bg-green-900 dark:hover:bg-green-700],
    dialog_close_button: %w[w-auto px-4 py-1 font-medium backdrop-blur-lg hover:animate-pulse border rounded-md] +
      %w[text-neutral-500 bg-neutral-100/30 border-neutral-500/30 hover:text-neutral-900 hover:bg-sky-400 hover:border-sky-700] +
      %w[dark:text-neutral-500 dark:bg-neutral-800 dark:border-neutral-200/30 dark:hover:text-neutral-300 dark:hover:bg-sky-600 dark:hover:border-sky-300],
    wait: %w[w-4/5 px-4 py-1 animate-ping rounded-lg background-blur-lg border border-sky-900 bg-sky-100/30 dark:border-sky-100 dark:bg-sky-900/30]

  }.freeze

  DEFAULT_CONFIG.keys.each do |key|
    define_method(key) { @config[key] }
  end
end
